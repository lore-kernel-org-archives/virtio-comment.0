Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAD63A9DAD
	for <virtio-comment@lists.linux.dev>; Tue, 24 Feb 2026 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771954619; cv=fail; b=hQZ3OmN/uGqZ5EHc87YRYtyGjoGJtJOxmhxtpTfK2mjBFvDeRlnY898Rz5fHLvrVMt9ZY7XkWnhnfcywr4QhQCmoU1OKI8ISYGsDlNU9If42iq+1GWxHwf0nG1YZ7vmYd/v0rDCR50WZ6kWwHGM//yVzxPmpvxdv4qJZgfF2sec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771954619; c=relaxed/simple;
	bh=Sudw0ofMsZA9dMXxspoYFdtyAKRwu/yKPKDG4Kqjst4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mbxez/S7w49hbgbSTwDRW4dQcl8lh3zs3Wza/vr2cyDFRJkc4HZ1KLC4VT/sIrieNPh163KoqeGlYj8y1Od1dqmYjJPCAsqarnJIOuDVGU8sp9mzWC+iX82C8PbGNHtIEPxHus7xIcJjfEIqcdxgwpdphrH6EyOiG1NdMLUhClo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=v4Ruixa7; arc=fail smtp.client-ip=52.101.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="v4Ruixa7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PP3NPPwcJ4URSYe/jFOC6NkqbhiU/uEcSTHtOJzpSntkfenDpl3FXnJqxLrNNcOSOz4SmW/+2vOjeq8T2NNXsp2nMHRaXURyYc62XDEdNlxgeqrhPR/07zk+w7KPUtUmC+0Nu9UCQBTCBgqFHo6li/nJd2qhj++5uPVErFNCUhkZjaQ0MuvvmyxToyl0+D03OG1DqbcJPDu/7FF1PhpJcgW2dyuQVBWw7Sj0zr2cTaRsGuHBkEiMrWogq1JBtmHGaFwZWclAohVo9neNcBSNI4fKHdGv7R2Yqv7jjM/Ix4zPJRQ0LX/Ud4EKf1gMp1lsez8MK4o0WO8iEp08cJ3oSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyTEWIGIoBE60g3E6ytgaW5Me4Tfs9RSlUr3P7t90i0=;
 b=AEMxPDGzOTSIpMlPjmdH6ABx3oB0+Y4yalavdjNEqC3DdryXuUc2wSctrP0+ZOa7LdO+gkQcuCuG26sm2BnRln6TtbYHffi+0N2Hc18PKNb74Y1RZiqASuovLV8m9TCFRVOVU9oK9NlUPNFtQ4zozsHUtdDohpmpQpuVF3PnSAhV4tjivmFIzPd+M5V5ZVT+/BV36LwR1pUbT46WTHoke2fnIHaHxaIL0QRGZX3yTW22BZY7+HldZteqjzGJLskGU6FM5lreuUn4rE0CD1LXuCP46dnCD2UiiF/vrTs3FBBQQeueBqB+9GCFIcZ77tUoNPsmAbVWOAoONM5nUYIV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyTEWIGIoBE60g3E6ytgaW5Me4Tfs9RSlUr3P7t90i0=;
 b=v4Ruixa7yRa9SdblrvGBEOzYiNEsV/SQol5HsC6YkF9hOEv4WlWShi3uuIlsA8Ntndf8hFNXugS+XntUMhOBjHfoxO14HgVQdEW/l4CbvdLD4jzB2V6NyUsjTqdj+c4Tq14pwdWT3cK36eJ3J5v5ONz34UxJuQocbw51dnn/uZY=
Received: from BN0PR04CA0090.namprd04.prod.outlook.com (2603:10b6:408:ea::35)
 by IA0PR12MB9048.namprd12.prod.outlook.com (2603:10b6:208:408::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 17:36:51 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::46) by BN0PR04CA0090.outlook.office365.com
 (2603:10b6:408:ea::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 17:36:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 17:36:49 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 11:36:48 -0600
Date: Tue, 24 Feb 2026 18:36:47 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: Bill Mills <bill.mills@linaro.org>, <virtio-comment@lists.linux.dev>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>, Alyssa
 Ross <hi@alyssa.is>
Subject: Re: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Message-ID: <aZ3hJoolYGzZY7nG@zapote>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
 <c0e37ee7-9631-4611-ace2-43609dc11ab2@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c0e37ee7-9631-4611-ace2-43609dc11ab2@gmail.com>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2026-01-25)
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|IA0PR12MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: 6633d645-1067-489e-9a0a-08de73cb4a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nxt6lJlepRBcyRKDOQJk7nSsEd+ojH9XSrnXSuE/ukuxHbXNnYvVsltLn0vX?=
 =?us-ascii?Q?M79744PPlxuEZXxQRm4unJFL8tfdfqZqFP3X2+Lp1us03DAasq/IS787IdW2?=
 =?us-ascii?Q?lnpuCBwwfuLMdYDySpD2MweRZLiGLE7mPPIPHdDngjnfBV6cenCpMC/MJQdj?=
 =?us-ascii?Q?PnsUHjJ2zgW+igJn0/JCbL6gaVL65pk5HSKsrJ1uvT2YbaVXndAJtKZBK8dz?=
 =?us-ascii?Q?n1igYvmAIUCD5fOQ2LCkoDuaAHZxPjW8Olb46Esc1AGfiSBE3lL5Is7zQa3d?=
 =?us-ascii?Q?Dhiy8As6P3Eaa0F3frFgoA5YnVeLKF9e/ty/zOFZV4wZQO3Vq8hhWbdNhZcL?=
 =?us-ascii?Q?ypwNHsHJ62h/zyDo3mWvhquy7RF5JlBMluO73CrDCgk2WowVElvizIPJ1Ffw?=
 =?us-ascii?Q?Y1tMRYlGJ825VFfjstCLm0nFBRR0oesakOWxPV3EmfuBctK7MCKtGKsTI+Cg?=
 =?us-ascii?Q?ytq0vCyM/2dvBDbYzJ910G9QkBaHsVSVCADTw+G/f/dS9gvb70sW5h+Am2Iu?=
 =?us-ascii?Q?Zhr2YmBHJsD+uaHDnpV6gou+m2iw1UQbj0aH9reK3VK9/elBHmhs4IYA7oXr?=
 =?us-ascii?Q?/emosOHnt+arwYDBNqlFmcWM5yiZIvjdw+seAMHt7Dcz4/bjdbuXE/i58u2k?=
 =?us-ascii?Q?Au+ovUrM4/Um/45E+9P+lEFOokOy59tbrJHmZw+bDKoRQunCYUTrjyeDakHN?=
 =?us-ascii?Q?+zVlLtSoCHR6bzChkhAkVRC/pXJqHtcIhFR+9vONCq0gq7zTY0czmtZHVie3?=
 =?us-ascii?Q?XgHFGGMPCBC7BoqLDmj9OWnFmOZO3qWaVJb11iREBIXBPLVlIAdmN6xxrX/E?=
 =?us-ascii?Q?Yuh+Kf6aLocLQ84yRMD+aj9wpiSsppLHZXWxjz6N/a4A+4xj/a0awRuA097a?=
 =?us-ascii?Q?K51pZKRmllkcXgCewPodCesYid4Sqg/YKBgoMm4vxpYGSGQK766v4HZSoO7C?=
 =?us-ascii?Q?8fvAEtO4As97b6wVv6EHlHtS2ULiHPjOhxeOyuvhHJq8U0WnmJqx3EQEdvQx?=
 =?us-ascii?Q?dywTOrsLy0Q64yR+NafkWoXpOgXkj8/wrp1sV2bW4KVmA7Q9UHtyCZ1iIiW5?=
 =?us-ascii?Q?3Lm+/lnNnztMa35ibaEjqcITZRHASTO0Ndx3qGJvmmRd8O5uFWqL72+BdVun?=
 =?us-ascii?Q?iUbcg00V1dHlJ2ibe5ixgdV1GMRgHRflnIo0c2LMe6ruOr7XpjUmIpIO5bZQ?=
 =?us-ascii?Q?CQodtyeWxVijI7qdttfinKU/Q/hcYTwrxLN8NG3X61GFYPyGnPJi9HATX7T0?=
 =?us-ascii?Q?VBIg+uwzhA3Se+YEHizLDOPVvjf4TDJTML5U1dz81lzG72HoXZN4sKITlhhR?=
 =?us-ascii?Q?nVm6dMC73odThbYtRJA48m1a2DS2WIemuQZy+IGBzWQ2AtnLRPvYVgP7YkAX?=
 =?us-ascii?Q?0Ve0833I0OYtNOTETxFudLgL9i9TIYUYPIHGNZ1ImBGqkOySM843dFWOSsWU?=
 =?us-ascii?Q?byQT8jfHZkfIbxryyfeX34lN2jwmT96hvxt/+DTRg456SZ9akhD/Pb4UUtrc?=
 =?us-ascii?Q?ebtVWJ9o68gjkJdtTRjEwNIAn/NVByPUzLjrfKOnlSw/OnWtxbW8hrotLrnJ?=
 =?us-ascii?Q?YXf/yCHTDdziJEpj0ugyoGIgrEibytrrK62CwvXJ8MG+3gSw1QvUY8v8zLby?=
 =?us-ascii?Q?vkqWmZ570H8OLyxwghf8mEI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i/RKDbtDQ3GFkAg/Ftz/dDuqdbAGB73w9Fa7z05JYkBRuirMP/Sn4eDGj/bg0+suY9FIzzrV5g/jiSUMjoiQruXNAQdJuzlC84uK4BfZUuUXl1Rj+6Cbr2C2Hj6SjOdcwPNWO+RXNtj+ES0M3/xTOjinshwMQRWqIW/2OmHBD1OT8WemfsJcjeHVUE4eGQbGJb1Befw6vT0crIW1SuoV+pIHy42it3CzI58RzuT4a5/pUU2HzskHIx0QZox/UhUJEThjdOcjj/NejRIsH68Z0fW0ynXQf+ZYQmgTe7bGGHzwoDJqrWhPN0bxWLORne+YyzgbySKPvZ3bqMVazUnC6NTRVVCV6XQIK+8qWgAeGTW8i3iOTCqVz2UeBmRon0hWsLdMRx4fs+3N9mE+ckpRMkq/iiZ9hYiTvW8FqDiXuHilFS96daJjmThsEhUDbONb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 17:36:49.6428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6633d645-1067-489e-9a0a-08de73cb4a64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9048

On Tue, Feb 24, 2026 at 10:41:59AM -0500, Demi Marie Obenour wrote:
> On 1/26/26 11:32, Bill Mills wrote:
> > Add a new transport layer that is based on messages.
> > 
> > This transport layer still uses virtqueues as the other transport layers do
> > but implements transport layer operations by sending and receiving messages
> > instead of the "MMR" reads and writes used in virtio-mmio and virtio-pci.
> > 
> > This transport is useful when the device and driver are both implemented in
> > software but the trap and emulate operations of virtio-mmio and virtio-pci
> > can not be used.
> 
> Is it possible to map a virtio-mmio or virtio-pci device to virtio-msg?
> For instance, can a VMM present a virtio-mmio or virtio-pci device
> to its VM, while using virtio-msg to communicate with its backend?

Hi Demi,

Yes, that is possible. One of the first implementations of virtio-msg
was using a generic proxy in QEMU that translated virtio-mmio and
virtio-pci to virtio-msg, at the time there was no virtio-msg Linux
driver so this served as a stepping stone. I haven't kept the proxy
up to date though.

https://github.com/edgarigl/qemu/blob/edgar/virtio-msg/hw/virtio/virtio-msg-proxy-driver.c


We also have a proxy for Xen that translates a slightly modified version
of virtio-mmio to virtio-msg.

https://github.com/Xilinx/xen/tree/xlnx_rebase_4.20/xen/common/virtio

Best regards,
Edgar

> 
> > This transport is intended to be used in many situations, including:
> > * between a host processor and its co-processors
> > * between two different systems (not SMP) connected via PCIe
> > * between normal and secure worlds
> > * host to vm
> 
> How does this map to the vhost-user protocol [1]?  Vhost-user is a very
> common way to implement devices and it would be nice for virtio-msg
> to cleanly map to it.  Requiring a separate AF_UNIX transport could
> be quite disruptive.
> 
> [1]: https://www.qemu.org/docs/master/interop/vhost-user.html
> 
> > * vm to vm
> 
> This requires a method for VMs to implement devices, not just drivers.
> For Xen and FF-A this is easy, provided that there is an out-of-band
> means to enumerate which devices should be implemented.  However,
> these mechanisms are not hypervisor-agnostic.
> 
> It would be much better to have a standard virtio device that backends
> could use to implement virtio-msg devices.  There have been multiple
> attempts at a virtio vhost-user device backend [2], but it was never
> widely deployed.
> 
> [2]: https://stefanha.github.io/virtio/vhost-user-slave.html
> 
> > Signed-off-by: Bill Mills <bill.mills@linaro.org>
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > ---
> >  transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 1640 insertions(+)
> >  create mode 100644 transport-msg.tex
> > 
> > diff --git a/transport-msg.tex b/transport-msg.tex
> > new file mode 100644
> > index 0000000..d4e31d7
> > --- /dev/null
> > +++ b/transport-msg.tex
> > @@ -0,0 +1,1640 @@
> > +\section{Virtio Over Messages}\label{sec:Virtio Transport Options / Virtio Over Messages}
> > +
> > +\newcommand{\conceptref}[1]{\hyperref[sec:Virtio Transport Options / Virtio Over Messages / Basic Concepts / #1]{#1}}
> > +\newcommand{\msgref}[1]{\hyperref[sec:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_#1]{VIRTIO_MSG_#1}}
> > +\newcommand{\busref}[1]{\hyperref[sec:Virtio Transport Options / Virtio Over Messages / Bus Messages / BUS_MSG_#1]{BUS_MSG_#1}}
> > +\newcommand{\msgdef}[1]{\subsubsection{VIRTIO_MSG_#1}\label{sec:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_#1}}
> > +\newcommand{\busdef}[1]{\subsubsection{BUS_MSG_#1}\label{sec:Virtio Transport Options / Virtio Over Messages / Bus Messages / BUS_MSG_#1}}
> > +
> > +This section defines \textbf{virtio-msg}, a transport mechanism that encapsulates
> > +virtio operations as discrete message exchanges rather than relying on PCI or
> > +memory-mapped I/O regions. It separates bus-level functionality (e.g., device
> > +enumeration, hotplug events) from device-specific operations (e.g., feature
> > +negotiation, virtqueue setup), ensuring that a single, generic transport layer
> > +can be reused across multiple bus implementations.
> > +
> > +virtio-msg addresses several key objectives:
> > +
> > +\begin{itemize}
> > +  \item \textbf{Support multiple bus implementations:}
> > +  Systems can rely on various communication methods such as hypercalls, local
> > +  IPC, network channels, or device trees for enumerating devices. virtio-msg
> > +  defines a common transport interface suitable for any of these mechanisms.
> > +
> > +  \item \textbf{Reduce per-bus complexity:}
> > +  Buses can implement a fully message-based workflow (including optional
> > +  enumeration via \busref{GET_DEVICES} and hotplug via \busref{EVENT_DEVICE})
> > +  or they can discover and manage devices through
> > +  alternative means such as platform firmware data. In either case, they
> > +  forward transport messages to and from each device.
> > +
> > +  \item \textbf{Preserve virtio semantics:}
> > +  The transport leverages standard virtio concepts (features, configuration
> > +  space, virtqueues), so existing virtio drivers and device implementations can
> > +  integrate smoothly once a device is discovered and registered.
> > +\end{itemize}
> 
> I see that there is support for device enumeration by drivers.
> What about driver enumeration by devices?  An FF-A endpoint or Xen VM
> needs to know which devices it should implement.  In embedded systems,
> this can be obtained from the device tree or ACPI.  However, dynamic
> systems need to create and destroy devices at runtime.
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)





