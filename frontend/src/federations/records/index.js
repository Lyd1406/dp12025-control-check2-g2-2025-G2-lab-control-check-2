
import { useEffect, useState } from "react";
import tokenService from "../../services/token.service";

export default function HistoricalRecord({ id }) {
  const [record, setRecord] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    const controller = new AbortController();
    setRecord(null);
    setError(null);
    const token = tokenService.getLocalAccessToken();

    fetch(`/api/v1/federation/${id}/records`, {
      headers: token ? { Authorization: `Bearer ${token}` } : {},
      signal: controller.signal,
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("Unable to load federation records.");
        }
        return response.json();
      })
      .then((data) => {
        if (!controller.signal.aborted) setRecord(data);
      })
      .catch((err) => {
        if (!controller.signal.aborted) setError(err.message);
      });

    return () => controller.abort();
  }, [id]);

  if (error) return <p role="alert">{error}</p>;
  if (!record) return <p>Loading records...</p>;

  return (
    <div>
      <h1>{record.federationData}</h1>
      <table>
        <thead>
          <tr><th>Event name</th><th>Participants</th></tr>
        </thead>
        <tbody>
          {record.events.map((event, index) => (
            <tr key={index}>
              <td>{event.eventName}</td>
              <td>
                <ul>
                  {(event.participants ?? []).map((username) => (
                    <li key={username}>{username}</li>
                  ))}
                </ul>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
