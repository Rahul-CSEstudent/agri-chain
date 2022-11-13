import Home from '../components/home';
import { ThirdwebWeb3Provider } from '@3rdweb/hooks';

// Passing in a theme is optional
export default function MyApp() {
  const supportedChainIds = [1, 4, 137];
  const connectors = {
    injected: {},
  };
  return (
    <ThirdwebWeb3Provider
      supportedChainIds={supportedChainIds}
      connectors={connectors}
    >
      <Home />
    </ThirdwebWeb3Provider>
  );
}