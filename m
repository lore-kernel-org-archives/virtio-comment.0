Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E4BA21
	for <virtio-comment@lists.linux.dev>; Tue,  3 Feb 2026 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147821; cv=fail; b=tEkICiqYJNkY7rIbEs6RziEVB7RJvd101TJ4LW5zpgg97dUFCK+9w5q+F4dakj8lI9v1NXzQgfdaLmGB1ezb5vtj0Rg77B29HGYUu8a07FZF5G+HWbhk4+JCH+4G183D71ftrJKFtaml53nDErHy0v/1LLUYiL5EJgkGIESnhpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147821; c=relaxed/simple;
	bh=rBg2SiaEwquPeQy02V8nJqtJO9TuIXs3JnPc/Y86UVo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7sTid0KrlVs1Qst8riwOWT1s0nvXirLLo2Pjx/lK2qitW5UfJBAKyLsg7cUSWZjuLX8MRr2KHAyBFfSK11fIIdszJliMW/pva/Ehm7yaqC5iK4BzhDoKbFXblio/QUGQCDm13pT25km9s8m3XSlZ1BgeaeE95fAnmnzr35jCgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MoqkPabT; arc=fail smtp.client-ip=52.101.56.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MoqkPabT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xP7l/U+eJz5JGVwxdlzjbCSb5eh+rojpNshPkZUriW3v922EqQcjoBBmgX3J3XL3WcggBHQ8RoG50f356joEQ0u5WlJWwelMoGsUbIHuQesq90d2YZnktaBa6MvofzsjDjYXyqBatelH4h7IS6E+mGlVcjX0aOyYepqyhnA3j53ne20zxC8j4qyN7RGAf28X3diNvKn0QaBBMVY3Mibd4T3qs3avy11ditYBt6ad35Lhgd7EVz7PBK1aEFUZnlujjDoaqgLttPVoBtF3E19M3K1wWdDc9DPWG9n1NgQZC+bp9aIDUOG34zdWclg5AGZMv+dGIpstmNdBlbw32/b5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIajSfhHYG+7D/sIyswb75fl3Xgozo9MtgotR+uJH+8=;
 b=kcQWjjSRTJDuFePPFP26fPxDc1srTWwAj+GRzNkakdDJY1vs9+YdiAqzy3c8FNeQmKaLliFnlECVr/OT3n+uavQIx0ntZ3NM8PsbfKJUhGZayYNGu8ByAppIed2wExsY2KaoooLU0EDa3bZjgUaMXJbloVECIMuryr1RVCyqOxrRq9d2vnuh4RsKnvyxWxTwRrafu3wNZUeqYuzef33HELAreGi/N0lg3IDTUwVj3/JheiPNQgcOfPEVycblvmptIhRXqkrZIBxVwtSbHRH0EDA2o00Qxyihj/4VviCRvAmtblMXLv0MW/S2fhF6U9wHkRzXqiFoRcjtHBrim4adKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIajSfhHYG+7D/sIyswb75fl3Xgozo9MtgotR+uJH+8=;
 b=MoqkPabTTXjwtFCAt7YReM/RGAbLGe0sP1Bkqn586ZFh1y5uUOUxcNvWUn22ETHqd1Xt/pmLqZzz5Rv4H8gWHMiwTDcmOTu41Mt6VTCmlnJ9YwdTg112T2J3bhkZaj+CAEUu1dTPE7BtygM9KC93Sn4fSHRoBc/WX/Y4ZcHA4ow=
Received: from DS7PR03CA0138.namprd03.prod.outlook.com (2603:10b6:5:3b4::23)
 by BL1PR12MB5947.namprd12.prod.outlook.com (2603:10b6:208:39a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 19:43:33 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:3b4:cafe::3f) by DS7PR03CA0138.outlook.office365.com
 (2603:10b6:5:3b4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 19:43:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 19:43:33 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 13:43:32 -0600
Date: Tue, 3 Feb 2026 20:43:30 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Bill Mills <bill.mills@linaro.org>
CC: <virtio-comment@lists.linux.dev>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 4/4] virtio-msg: add conformance entries in
 conformance chapter
Message-ID: <aYJP4nQkdeM-j1y1@zapote>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-5-bill.mills@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260126163230.1122685-5-bill.mills@linaro.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2026-01-25)
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|BL1PR12MB5947:EE_
X-MS-Office365-Filtering-Correlation-Id: fceb5ca6-1337-4ef8-e725-08de635c83b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XZIBel4xx9/Zl1iaHzFpaFHX2PowXpeeioU5g/JD1vpuwQkzgedgX3PPT/dX?=
 =?us-ascii?Q?HC5D5NxmJuQ9NNPdXUzmfoD/YXiOe9JVank4dxUBPE1uOSSmtnwXxdsqkSI4?=
 =?us-ascii?Q?bS6xeG3TQ73RWPotGKxBAxz1DvL+yTEOjEknK+orBWK6ls+rTKKHs4xZ8Eah?=
 =?us-ascii?Q?CxdIN37RcrcBzAizjGO7cM4EVlKoiLIoer2f/j1K+s+up1QZn/ZrdRt3OkIE?=
 =?us-ascii?Q?Chfo0+HqhVHEVwAdKCIZZiZVD5if0D22yevuoj0mNJ4Jo7IRPGNiaVp0Gb6W?=
 =?us-ascii?Q?yx4hRPhk4sniNqANLzWhNrHfPPwsKEQc+8yYm0/1qbWl3e4AP6enXc8Tk5K9?=
 =?us-ascii?Q?VlkqmWHnr8xvil811Cmt2KOCQC9P3tVvLEFS96xySTp+w/cWIsaXDpL5ypT4?=
 =?us-ascii?Q?vceW3As2M3YLSOg6u2hvsSHkqCW/2CrkcNCs2sf5JKsnb2HH+qtODZ1XL0Ks?=
 =?us-ascii?Q?iDLM4Gfo+rqBuBkcEJJOYXsuf/uYWLvfnVVGawijCk5Ew0RDuiOh0hd2zUTx?=
 =?us-ascii?Q?AaWRzhkpoNy5WcS5UJfrNOnPewUSdcFlGWjSXDvpkmI3aSeBCjPrkkHH/oG3?=
 =?us-ascii?Q?AkskVtUCNe/XyKZqUgMmG+dWDHLdfAi3iabhuYyxUPW6d6XXGpj/9ug4AT2M?=
 =?us-ascii?Q?H5SdGZbv8ulffTbsMShG77xUwhVfiroVkBsn9p+/npHHlav1QOYwQKFMHcSF?=
 =?us-ascii?Q?8Wb+o0HNDGm+qZrs720y+oFg0OwSDCED3d+fK+OqShCoBcZSahuAZvwOeJ0Y?=
 =?us-ascii?Q?KGfPHZr/UtD+wvp9GkUmJUDDL/sF/v+2EHEQuagijxQr4ZLJSdYJ0ZuAoNTD?=
 =?us-ascii?Q?jU3//HKbf100DMbzMRMEL0mz7HuUVzBxj18Yok1vryWAfFoKUZJnlzkatqwU?=
 =?us-ascii?Q?oCPUqZSGnY1RBltMnZJr2LQi0GwVTZ92S7CVe/2tykvwFH2h8lBArmSUlrKG?=
 =?us-ascii?Q?gUTO9UtD3Tvl7SR2t36uGMkSIyx1xPZ1hlx6RoQcTBUDgwGRG9iXjZzKh7Dy?=
 =?us-ascii?Q?S7sk+dhyDVHHlBG76wi037P35ii+istl93SoofXAF7Bu9ks6X1O2ixD/oznN?=
 =?us-ascii?Q?q8VSkguJyoMcHABs9k9NbL6rNBkjo4X4P+c7uqan6ORFzkwdJTU5CclRN3zh?=
 =?us-ascii?Q?aVYcUkAphWPx4fqqohIssC/AV6eaPvS+qM69ZgCt5oTZ8ofyK/QF0qn2K+0q?=
 =?us-ascii?Q?vcsxO2PuYyRnUCUDhMrDXtHPwMfNtAPEKm0dYv/R/ETNaeTCMpDnOd8tlZXz?=
 =?us-ascii?Q?nTqcLfIGVJEvQ8XYtjx7Ey21eGvX5/dqm1i/iLNZzHonvqA2WXO1mG7MupuI?=
 =?us-ascii?Q?FdEdLUmMPmrDeHHn5X7RdEuNyrleDfDE3F9/e8XpmSnViEwprgpO+htD5Lg3?=
 =?us-ascii?Q?J13UZheUnRsEw8SVLf5hEjpzE3xcuys9NiYAjNCxZQJeQBe/ZRHyIbSX2PPt?=
 =?us-ascii?Q?jGO5+EaaarPNhrx2JZLIcAq+j8lelLXikbFCod1/rUUg0ibm5TdwOnxUakSJ?=
 =?us-ascii?Q?TomzO4tU65RAb2xygG18gy43toiG40zfAfQVWElR70AnfL4FJKJC6nhDFCyr?=
 =?us-ascii?Q?Vi5JWJ0QOPWcIwazEee3YkPIabMAu4tA0xgxFeo+SIyk3M0P0fUEvY1/eKO8?=
 =?us-ascii?Q?RDtTwuDoTnvU2SgKWwUidNIjj8EYgPGfIPzQmrrP72zROiEkoj/X0ZGZpkMz?=
 =?us-ascii?Q?fu7WFg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8IalHvSHBn0kkP/B+MrZLocvyfYnz1w4jA2Iz0s7/96bQKvWfyYakoqFk2iJkaXlhvHxvqKzu+bxbZ/K2mQqelPRRfD+H48/MQM0WBPRdAufetnSP0q58eyHQPrAN19wP5JHVYzKJGCNMCWpCXLSssBQDJCt94iXOuvp47uGNXT24PFTILhz+h8+18YFwTILnInxts2rUElJEeQ8u/GDZ7lYOGc+n/Ty9g09+MBAJ4KfWkuiIvYM2/hmaBb7GS/OymNuaTA3Fpw7tPGw/S15pXyUjfXJHCfZ0XK8H7Msck5vR+ZFhzw/S0W+siGNInJBQr27e1v9DmkL5/kM3lf6/AWyFJq3pOjh26V930muJya6OJxx01e9qr5vHiLjOjM5lKr4L3P4tTz46Vaue9s0PGk+rKOOCSuq9kLd8dcggu/IPlute4o/37llaId3K7XK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 19:43:33.0269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fceb5ca6-1337-4ef8-e725-08de635c83b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5947

On Mon, Jan 26, 2026 at 11:32:30AM -0500, Bill Mills wrote:
> From: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Add entries for conformance of Virtio over Message for Driver, Device
> and bus.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Bill Mills <bill.mills@linaro.org>

Acked-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> ---
>  conformance.tex | 105 +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 103 insertions(+), 2 deletions(-)
> 
> diff --git a/conformance.tex b/conformance.tex
> index 9af31e2..7d5d00f 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -14,7 +14,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item[Driver] A driver MUST conform to four conformance clauses:
>    \begin{itemize}
>      \item Clause \ref{sec:Conformance / Driver Conformance}.
> -    \item One of clauses \ref{sec:Conformance / Driver Conformance / PCI Driver Conformance}, \ref{sec:Conformance / Driver Conformance / MMIO Driver Conformance} or \ref{sec:Conformance / Driver Conformance / Channel I/O Driver Conformance}.
> +    \item One of clauses \ref{sec:Conformance / Driver Conformance / PCI Driver Conformance}, \ref{sec:Conformance / Driver Conformance / MMIO Driver Conformance}, \ref{sec:Conformance / Driver Conformance / Channel I/O Driver Conformance} or \ref{sec:Conformance / Driver Conformance / Virtio Over Messages Driver Conformance}.
>      \item One of clauses
>  \ref{sec:Conformance / Driver Conformance / Network Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / Block Driver Conformance},
> @@ -45,7 +45,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item[Device] A device MUST conform to four conformance clauses:
>    \begin{itemize}
>      \item Clause \ref{sec:Conformance / Device Conformance}.
> -    \item One of clauses \ref{sec:Conformance / Device Conformance / PCI Device Conformance}, \ref{sec:Conformance / Device Conformance / MMIO Device Conformance} or \ref{sec:Conformance / Device Conformance / Channel I/O Device Conformance}.
> +    \item One of clauses \ref{sec:Conformance / Device Conformance / PCI Device Conformance}, \ref{sec:Conformance / Device Conformance / MMIO Device Conformance}, \ref{sec:Conformance / Device Conformance / Channel I/O Device Conformance} or \ref{sec:Conformance / Device Conformance / Virtio Over Messages Device Conformance}.
>      \item One of clauses 
>  \ref{sec:Conformance / Device Conformance / Network Device Conformance}, 
>  \ref{sec:Conformance / Device Conformance / Block Device Conformance}, 
> @@ -73,6 +73,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>    \end{itemize}
> +\item[Bus] A bus implementation MUST conform to clause \ref{sec:Conformance / Bus Conformance / Virtio Over Messages Bus Conformance} when providing Virtio Over Messages.
>  \end{description}
>  
>  \conformance{\section}{Driver Conformance}\label{sec:Conformance / Driver Conformance}
> @@ -147,6 +148,42 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{drivernormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
>  \end{itemize}
>  
> +\conformance{\subsection}{Virtio Over Messages Driver Conformance}\label{sec:Conformance / Driver Conformance / Virtio Over Messages Driver Conformance}
> +
> +A Virtio Over Messages driver MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Revisions / Driver Limits}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Versioning and Forward Compatibility / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Configuration Generation Count / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Endianness / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Common Message Format / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Overview / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Information / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Features / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Configuration / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Virtqueue Configuration / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Status Information / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Finalizing Initialization / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Driver Notifications / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Device Notifications / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Configuration Changes During Operation / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Virtqueue Changes During Operation / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Reset / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / Mandatory / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_INFO / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_FEATURES / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DRIVER_FEATURES / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_CONFIG / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_CONFIG / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DEVICE_STATUS / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_VQUEUE / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_RESET_VQUEUE / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_CONFIG / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_AVAIL / Driver}
> +\item \ref{drivernormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_USED / Driver}
> +\end{itemize}
> +
>  \input{device-types/net/driver-conformance.tex}
>  \input{device-types/blk/driver-conformance.tex}
>  \input{device-types/console/driver-conformance.tex}
> @@ -241,6 +278,43 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{devicenormative:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
>  \end{itemize}
>  
> +\conformance{\subsection}{Virtio Over Messages Device Conformance}\label{sec:Conformance / Device Conformance / Virtio Over Messages Device Conformance}
> +
> +A Virtio Over Messages device MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Revisions / Device Limits}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Versioning and Forward Compatibility / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Configuration Generation Count / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Feature Blocks / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Error Signaling / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Endianness / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Common Message Format / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Features / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Device Configuration / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Virtqueue Configuration / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Status Information / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Initialization / Finalizing Initialization / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Device Notifications / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Configuration Changes During Operation / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Virtqueue Changes During Operation / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Reset / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / Mandatory / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_INFO / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_FEATURES / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DRIVER_FEATURES / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_CONFIG / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_CONFIG / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_DEVICE_STATUS / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DEVICE_STATUS / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_VQUEUE / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_VQUEUE / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_RESET_VQUEUE / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_SHM / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_CONFIG / Device}
> +\item \ref{devicenormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_USED / Device}
> +\end{itemize}
> +
>  \input{device-types/net/device-conformance.tex}
>  \input{device-types/blk/device-conformance.tex}
>  \input{device-types/console/device-conformance.tex}
> @@ -265,6 +339,33 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \input{device-types/media/device-conformance.tex}
>  \input{device-types/rtc/device-conformance.tex}
>  
> +\conformance{\section}{Bus Conformance}\label{sec:Conformance / Bus Conformance}
> +
> +A bus implementation MUST conform to the relevant bus normative statements.
> +
> +\conformance{\subsection}{Virtio Over Messages Bus Conformance}\label{sec:Conformance / Bus Conformance / Virtio Over Messages Bus Conformance}
> +
> +A Virtio Over Messages bus implementation MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Relationship between bus and transport / Bus Messages}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Relationship between bus and transport / Transport Message Forwarding}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Revisions / Advertising Transport Parameters}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Revisions / Message Size}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Versioning and Forward Compatibility / Bus}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Device Numbers / Assignment}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Error Signaling / Bus}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Common Message Format / Bus}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Ordering / Bus}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Device Discovery / Bus}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Driver Notifications / Bus}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Device Notifications / Bus}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Device Operation / Hotplug and Removal / Bus}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_AVAIL / Bus}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Bus Messages / GET_DEVICES / Bus}
> +\item \ref{busnormative:Virtio Transport Options / Virtio Over Messages / Bus Messages / PING / Bus}
> +\end{itemize}
> +
>  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
>  A conformant implementation MUST be either transitional or
>  non-transitional, see \ref{intro:Legacy
> -- 
> 2.34.1
> 
