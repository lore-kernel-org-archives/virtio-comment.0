Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DE42AEE4
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729257501; cv=fail; b=pwISmsgCPt92j3IMW7tiDqWgzN4YiZlqa4LlvV7GFvWEDjMMbH75ea22OU8fnxeABo3ZP+3ttmUeFLHbUWX/zIj2SJHFtfhXTb2BYJfHnelCVXkasZ+yGbI0I/g5vO8zUedAUAajbb6jZjYe4S3rR1zyxsdLoN9PvAhM9WBmdaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729257501; c=relaxed/simple;
	bh=5+idjlJC7bEpeyBaf+/imClCI50X3uwnVPAb1kjycbA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ELZ/hMmDM2hFZ2Dj2YRUgLLdKCqZijuoEEWV/RZEai23lG0naLokCayQhaa4Xkuz+wOozvZzAA2Rx5CdJJ3dY5eEkpnpgb/tUNrxdWjTicJ2Eqly4sg7bdWXiE95O62TVd58HcJWfjwsXhnoNkQFQ13np6bT4yF74CbeO1YiFgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JH/3c7q2; arc=fail smtp.client-ip=40.107.243.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JH/3c7q2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1mQh6tHtF1C/XxhSkbNSPyZM3k362q44vNASfyCuKSWkz7cx7n2UZQ5kzaC8fJ8Zimh6mX79HZ1MtiTBIeUHTzrpXNXtzRNz39JDWHffitL7A1RNZTC5ao0UoMp+dFzB80apuSEiMpiroi6chDZMVxEdsHPdtnN7BSqdXvWudhHMjS+CdtWDKuaGcboW+o2sz1Ts2ZLuUVSyq27XbYJkcr56TdAZ8cCyUzIW+VsTjVW1Ot0oaBR2cq+v4mPF2IMApIhBO6BJs08PNopihWo9q9Dh1GkEb9GcfgA5+jGk+TMw8v93WjpSTA/ob+qeBpjI7G6wAmFMfV+WPhRRkr5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EArqZ+yNH+3SEJeS03uk27ziU+OVLxP81y02tSAyvuE=;
 b=I5Kqk6R8U1nboox3o3HZJOLsFu2yPoZrTgf98S8Zz2T/qhyPbNAcy3kiNhiNVQL7Mu30RsXGZsHwSebnKm7pDnXUcUqm03AvFbxAorToPI60QTL0hzgOAa0DPgkJ2uj5Ka+axRDIlagp+Fm/HzSgA/JFASa7HqVZpXqYJd3783SX/F5iGoPFPNXsSF+ytENtaZdJ4IQbEkYssWBYKV+/bbEZln6+Pql0tpnE9Kh9Z+YXuE7Jj1dqPjbY1FVkzSXmX5vxLy5zWZUCrqv2fiNRtbTkrizS6dhrGTKlh4QgPdwIttzAzHJaatoOKyKl7mgfNiMnnP+WnNRuSj+AvLSW2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EArqZ+yNH+3SEJeS03uk27ziU+OVLxP81y02tSAyvuE=;
 b=JH/3c7q2AJQcmgvbBjtMvAnNUsEZqufu4QAaYkFiICbmVledwMHlb/Gv/9BtbFhSJDJPwCSKWFGRNDXq7xZ17Xv4Z9DDDIhHLsBr7g+NSWIxunFezpDI222idf5b9t7Tg93pgLdOCT1I+YVtdqmlVrSfM3TiYd1X5oBFWKsf0AaEfg0YXDYfIzHO2PQykNMt/rHnJ5Nswp076rBs9l5j9783TpXVMvT1HbcdgkqE5zVb7qXOTitDxv1PL3XA/+grzYO/Vg2NDvlk2YHPn9Uju5PDhVM9aQyyJo+dPpFOA2taJLrzhLroPfLBJXz7i3Q2XLXlsv+UflcbcS5UJ+DFtg==
Received: from BN8PR12CA0017.namprd12.prod.outlook.com (2603:10b6:408:60::30)
 by IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Fri, 18 Oct
 2024 13:18:14 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:60:cafe::37) by BN8PR12CA0017.outlook.office365.com
 (2603:10b6:408:60::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21 via Frontend
 Transport; Fri, 18 Oct 2024 13:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 13:18:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Oct
 2024 06:18:01 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 18 Oct 2024 06:17:58 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 2/3] device-parts: Add device type specific raw selector
Date: Fri, 18 Oct 2024 16:17:40 +0300
Message-ID: <20241018131741.443635-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018131741.443635-1-parav@nvidia.com>
References: <20241018131741.443635-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: a516cfee-e68a-4665-b4fd-08dcef77528a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wv2qHJTb2s6e+nYB/WjmJihGZnbl2LLzzcjMTLOpKfmLzu07HUhx0gnallRG?=
 =?us-ascii?Q?gDJb7DSvfxfd5WJD1YDj1/UBSTT654ybrbR1XIa4sCh58oKzeFvg3bJWnNA8?=
 =?us-ascii?Q?qYxC2hOvq2hbRybJ4SMTQbPmhiqdNfXZdB/MyzbDuoGBCWPgbX93sjz2mViA?=
 =?us-ascii?Q?9fSoXa0bkdEJAEx8fd6YpVOoMHMm3sRa4RvBK3HEUBeRR4T+QsCAHAU0XAO4?=
 =?us-ascii?Q?694ejrx8uQ/MhuM/LHgt5Rb5uRnSWtk+l0PmveTCvgtyGaQhrpL+0KKXXdep?=
 =?us-ascii?Q?VJUX5qAjSLa4CCmSO7CKJ6YKPYAPTkt5MFikY9tNcOI4mS4a0hiKgVqL0nU/?=
 =?us-ascii?Q?Uea2XMzpSuojYUCZRbSC5cyRTq7USiyobx7MlLQYlMSqipQC/6rgUtrSQap8?=
 =?us-ascii?Q?Lk+4bK3/VEwUn0ZG/D3eZTD64cFuzYvMYlQxpjAbB1yT2wnifB5JqRPwTVm2?=
 =?us-ascii?Q?C/8mwYzy7gJkJGFL4xCJVtgB4YQ2AwSy8ltzEPggVOxzCsCQYtAXOB/T8Qk6?=
 =?us-ascii?Q?a9TwSkr1Zep/tveV/aQY6pe5G4ASmJhMFxGhjSdDKeO3mjsdIqJRZttkdUh4?=
 =?us-ascii?Q?WrDnLA1nThX7XeCkeCkUMc0hdgsWOIP8VBcV84LlnwOkC2qHREAmJiC958bJ?=
 =?us-ascii?Q?EnxNuHVAWuLT3V9M4SF5mfwG7pvw/vr7Sztjl++S8hjC8jmEFOAl71fFkeHG?=
 =?us-ascii?Q?Qz2W/8TzeFTGiF9AfEFzObxoGvYZ8TbhBHaOemDaCTE8y46RMOYVF0WsGPzm?=
 =?us-ascii?Q?rsNKQ0LOBLl4gR7UCgvHjWuoTKPwCuE28ljN2jicZoWLMufFOYklnmKeUSNs?=
 =?us-ascii?Q?qH+ipnOtSeLc0aaG4nk/KZDmSbl9lMHyO7XEpvq7diLoyxNf8eKBlOFyS2Jd?=
 =?us-ascii?Q?pGM6p5lvGo7UrFpadf9bJ247BlV5CLepj+e4rV6w9z+bCL/Fd+HlwrtyLCRV?=
 =?us-ascii?Q?xxv4y9vZ+JRGaJGXoUvAbPs6wsUuymM9eRb6PVku8eF/dFghSiqhujQfQ4dp?=
 =?us-ascii?Q?x5oL/IVzDlGc/NIw8ncnR1ehNHfWDXb7x9sZm3b2iV6/xWAO7PEsaeQhRaS/?=
 =?us-ascii?Q?Y8MpJBNp/ZINDzYgjM9FTxvnaKzcK+rZGQdsww6Pxilg2yOXvxaJVta1NhrB?=
 =?us-ascii?Q?LbN5B4d/OeXP+u5E9EKSalUGLArlPVfajO6JblGoEYG3rOyB/BbBeO4QEg7H?=
 =?us-ascii?Q?hx7OjHCSBignufLQDEQ0PLnb1weGnmQRAkbu6xgpYExw5hqBeCBqAqpYtPL/?=
 =?us-ascii?Q?DR+jaUug8TY4FhtpJ1qxfrue/h4Z1x2yx5NGLS5vV+inb7vlyYi0PcxUV+Ku?=
 =?us-ascii?Q?MpNQWYCkNPqROTPDlJveNYA7s2bptN8BFjpIylnRHL9bYYOBSgsJdfZBgJXw?=
 =?us-ascii?Q?WYQLeGIMg6yViVjcEVWylWdGUjva+sZFYUW8a160quf6kqst4g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 13:18:14.2705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a516cfee-e68a-4665-b4fd-08dcef77528a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030

The subsequent patch defines the device-type-specific parts. For
these parts, the raw selector format is defined to ensure that
each device type can specify its format accurately.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-parts.tex | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/device-parts.tex b/device-parts.tex
index e59c0f9..ee743c2 100644
--- a/device-parts.tex
+++ b/device-parts.tex
@@ -21,6 +21,7 @@ \section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device pa
                         le16 index;
                         u8 reserved[6];
                 } vq_index;
+		u8 device_type_raw[8];
         } selector;
         le32 length;
 };
@@ -77,6 +78,9 @@ \section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device pa
 only when the \field{part_type} is VIRTIO_DEV_PART_VQ_CFG or
 VIRTIO_DEV_PART_VQ_NOTIFY_CFG.
 
+\field{selector.device_type_raw} is only used when a device-specific part is
+utilized, with \field{part_type} ranging from 0x0200 to 0x05FF.
+
 \subsection{Common device parts}\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts}
 
 Common parts are independent of the device type.
-- 
2.34.1

