Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793900272;
	b=jofCVsGb5R7sACG3ovFRktjoTlwYc8sd5qjg2FUREA3miZMc/zO6vxRPjdCy0cPgZ0r5
	 zicu0j1+9s7ORxfd65/fbUPuPJ438NkHPofon9AnlHgRb6H1jaVsv7g+FawUt7txxl+cE
	 YFwZ2I0BWlWeb9ItqWCwUZI3kze69HCwA/lgFI2yCXdvovzWj7VEddxXxQz3qvdCtgAS5
	 QiPBDznp1kfM1SBYR09echRVob1R0MhKLC/isQCw7lpVU/kvgqplY00lDUUcSfQbmtpo+
	 D4q6RPcRbroufEzz3BH5Ngpz39P7hPUUOiXbnoJ13wP+2LpEIGO/JcyDVft4/8mXMnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900272;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=naZIyh7dRyXeFyKJrYmIYrwdpS3BOC1c5a+L1wcdh44=;
	b=NdXEwoUMsWcZsIJXY7zhDx3mal7m/tSexm17PwOVPdC8RhRJjjdV+ZSCgKpuiZPHOQ8l
	 OystAbQ5tI/FNrigBiRmFLu7xArRg8r/b0PMMupGiFUm+i6bpZVIiiSd7GMlySGHjer8S
	 EgLukg0WRdoKr3yigrVm3WFTR5Ik89+gBYK4DXmCfcn6Ln58rttuT7iFGfKixFy8JLrjl
	 mwQzUv38cKLPRO8dgp9Br1ShqSHJCZU7a8WbRGqHPxGSZA2SN0Hb8rblPv53UIAx58Jp3
	 ZKquMUyZ1dzhLJzZGBnPUdjOZgsFIybCo6ZM6toXJUD3BRa1ww2dCWzrvsXkroKGzdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BGgpzNpM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.6
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010006.outbound.protection.outlook.com [52.101.193.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4D5606A31B
	for <virtio-comment@lists.linux.dev>; Thu,  5 Nov 2026 17:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB4D5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BGgpzNpM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mACACdfY//er519OMe9f3AVPK5MeYW8DFPgf8mIuZ3C7nR4w0LABbOzqV3n+5ycF8QGInP5pjGz940G+/5xUW/aYYrzZI/V74XJpuwXaaOk8Ks7eY2SXFN3yuW85vyqSRmpptcj6I6j7By3N8Z5Ickfxs9RlNCV88Z3LvjT5wBRwp0CgHS/ZWdTKkbm331HoE1KOBM5iRCeK7BXB6w2y7bosn3omiQUdLHTZX8/iuoJq7soMKrz1opvTii0+bjdK6M4TNH4EocyJ6OwsFEc6gSWikmrcaVqJUcZ4bc6DTCrjhobV0GFOzuLjCL54ltzHY4s5qhAa+CLuW+jOdxpvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naZIyh7dRyXeFyKJrYmIYrwdpS3BOC1c5a+L1wcdh44=;
 b=FDlKYoRRD5IfFKC4M+PneG4jk8FM91yQQkIzToVrBIWM0UArUo1vfkevg0v8gRG3ab4Fbu44NNlhqxwBXb0n8TDmAfaHJq0mpDlI8GeHpy+tEWN1/bUz5w7viUYzScinEIRxnWRwzuiBn1VGLznIrazYqRNY5EuKMml0OXoBeehCIgSSkDeRePPfM9odMNX1A0jK+q7pF3MHiRKOjtObPpcAaVy2uCeZ36kIYl3Gqh8i9va+85F2f2JBs+M5iLTJPX2ql2k8dAofyoe5+tiSht+ZwjVvWsNFLQ0D2ZIgSAvF1t5p34TPvIDXWW1scx+hPcPiD6PrJz8RFnusiSfceA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naZIyh7dRyXeFyKJrYmIYrwdpS3BOC1c5a+L1wcdh44=;
 b=BGgpzNpMoVCabN9L6Qa7MNRyhIwKuQLlXqFjapAx9eww5Ioqw2BK4gjh67Jk9bnQFaM259Gzo5QueXRGGUKno73NEQIRVlEMv+zV3Z8pdr611iAJNv883UAYm25vSuayD3YDDyB6HERdUekMWwiTmz5Lg9NmjIHPeOTeLMqoOck=
Received: from BN0PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:e4::12)
 by PH0PR12MB8151.namprd12.prod.outlook.com (2603:10b6:510:299::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:37:45 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:e4:cafe::65) by BN0PR02CA0007.outlook.office365.com
 (2603:10b6:408:e4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 17:37:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.0 via Frontend Transport; Thu, 5 Nov 2026 17:37:44 +0000
Received: from AUSALIEM01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 11:37:43 -0600
From: Amanda Liem <Amanda.Liem@amd.com>
To: <mvaralar@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <parav@nvidia.com>,
	<nathaniel.mccallum@amd.com>, Amanda Liem <Amanda.Liem@amd.com>
Subject: Re: [PATCH v3] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance label
Date: Thu, 5 Nov 2026 11:37:17 -0600
Message-ID: <20261105173717.11911-1-Amanda.Liem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <auIOjo37MTluz0fv@redhat.com>
References: <20261027154836.13778-1-Amanda.Liem@amd.com> <auIOjo37MTluz0fv@redhat.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|PH0PR12MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7e3a55-aace-437e-fdb7-08df3b637fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|261022105027099003|4143699003|11063799006|56012099006|261026121527099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	P8c5eaxPPe/dVlDNljqMlC/uGkOPsIvkHf0zOx6s02y3rAL1eeNlQ4nxVGF2FUHnEqzuxYZXjdC19HLOK1+dfetwxDuLgNp5Pc2XnS+rE6IZ42ofx4P+Zh9+uHakQC4OdhCnJEYg+o52jpkFTywoogZm19P3yn9qG2PbRYFd6Uxj8ttYqeXkumpaABcrQU+plTQSz7+mlviytqg17b0/6IVga0gFYZBUnVPGsCnMmHorq1Z559JtraTH/iixZ9Fti7eyqrSIokp9EQ3n3y4jEUByTOn5PJTERmCzIeeeoBA5SFjfPvda5rdT++PEfIXLDKMOFBLPo1ZWqhcFrV3gFIYopHqLRqaqghNv8f00Hk/QfERCkE3uKWsT/4hl0amoITjuo+tTj1TJA85gvp51sxKjSaMT/4vRm1hCLBrAW8IEyeE+V2MGjGRpave6Zx3m/91aUo1f3LwHkFUdaUjxV2sucH2/tnBZ3v4coTh98j2XQsRqiDYG4m4JYL9b4ePkAWrcWEeGj2HIzwOYO1j9FS2UldaSl2hFrUm065C758ZOLMhEn/MpPZ7W+ta8IAlQ6KChvOrHQfvw+6OOhUyBMs2Q/Wt96QEZwIqvEqHuT59DtXyXAegxqUkXpEd/5M6yZFQmVctyRfOshmIkUcFLM5RNH+JNK0bqSIyurJDTIp3jdcHpWm9LiSorPH07MtNdMe+fkef1YcRRYhgWeXZr/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(261022105027099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1xSxgZia9A3Qheb+d1KNR85cszaNcJKd/t3UmnPk+sh4gwgYr/u9NGqhNvQT7zf632l6ZQrTpQ4B4AXE3lTmaycIP1Yg9KcZeQVhOgD8AQ2ybyM1rLSiSzEk4fVs+igJghT25CzF4LIfhlxchImv/2XdTRdzDe6a4cGV9M0aTSJIZKBcUle6a8DFdz4R64/X/ViNJcENOGI9kAgiF/+J2XSvE1Wgc97J5EHKIDgS+0uULXl6FOFIuCbpgnv3jASKKnuk4ksI5xqkUzcB+LTn7kHxg0xEa4NmB2hd/4AGt3nCvrHlI/24vwRVOOAeFUsK71mGxGlzMo+8RIMtRpy5Pvob1U2raWQufiDteU6MBjrx/fxGOPbd70h83jvLGcpDHqxQT/c3dejt01sdkqaOYOHRK5RtemMjTtI385HhGBOKTvxFukcU3ksSth3JlJvJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:37:44.3286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7e3a55-aace-437e-fdb7-08df3b637fe9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8151

On Wed, Oct 28, 2026, Matias Ezequiel Vara Larsen <mvaralar@redhat.com> wro=
te:=0D
> > unique or that it persists across reboot or migration. Two device=0D
> > instances MAY present identical labels.=0D
>=0D
> You meant devices that were assigned to the same guest or different guest=
s?=0D
=0D
Both - the spec does not restrict it. Two devices in the same guest can=0D
carry the same label (both asserting the same out-of-band contract), and=0D
labels are not unique across guests either. v4 will make that scope explici=
t.=0D
=0D
> +\subsubsection{Label security considerations}=0D
> +\begin{note}=0D
> +This section is informative.=0D
>=0D
> Is this section important?=0D
=0D
No - I will cut it in v4. Michael raised the same point. =0D
=0D
Thanks for the review!=0D
Amanda=0D
