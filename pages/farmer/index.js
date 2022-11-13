import { ThirdwebWeb3Provider } from '@3rdweb/hooks';
import Dashboard from '../../components/farmer/dashboard';

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
            <Dashboard />
        </ThirdwebWeb3Provider>
    );
}