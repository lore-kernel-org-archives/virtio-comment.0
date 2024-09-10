Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441144A02
	for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 17:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725988085; cv=fail; b=O8NBJTRQmVVLhx04W9dVwqVpW6dFxzXEYJbKb+TudV6QJprImZ2RwMbo9gj+j4glH5ZO/jk5YnJMt2UcwHmOfPuVJBtz26Vub2wwIdx5Fp11e2suh1ZcbLlAhZxQV52K+rGUI/Shaih/RfRCX3ErYVanQ7ZwQDZgi8g2Cn5cH/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725988085; c=relaxed/simple;
	bh=WdbS/rvKBO735bRwsepx9tA5AxiMoTqCuHI3vJ4DpwM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AXzPpA5jrSwMBnYEU6e0RO07OW/hyhVvOlpFte7uqpF8c1EyahNC65EU41aug/19bBap40oFyG77OrBggGPkBaSWw9kVjEoUMwcaUQ5BcsUYI8vPlb1Co5e90scbq/pCPBufao2EQtOPiOqmSQM1T/4fFD4N7JguUCXa0ORmaPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lnW7xyV0; arc=fail smtp.client-ip=40.107.101.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lnW7xyV0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYJMjHbWESfTKzlFIvBWPM6y5ALKWT7N/k6RJvg3llX16InMCJsnA4ASi+AdeqB0bMneR03zdEgC9uBww8CqJ1ek9+/MWE8c1KsIZQEWIEDUn+ERWJaZm2FHLNlJSEjJQwp0JQ4ksMICAH6wUER3fJ6zKHi0gVadjlqrKxy7t5g3gNk/W4PebBJuwoRiYHR79SWghJtHc2mdtF2Cu1//Fj3dNK9EzE+ratJEd3exs6WopfgVSzizq6/5X1JTKa+VLBpSXUMsPwqn4L0VBABl5Ulspn89u06QTiydnfM0bwbQvonVvanZ4B5RZXcD+MIoqra+qv3cFjTiz+zv/K2xgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27UtitHgMoL3ZOixqA21hWtjrGT4gJwLsHe2Mz58dTg=;
 b=XKRBypRueMnlMvWpSdeOf563j9eXKkNNhUYoalzG5v8BNu7R5cAKP6LhiwPFhlSBXOBd49KeTqWg6wQ3b82LHruCIx94/MOZxIqGKuKWy6Z3OR64GYGjigbqZuSo9zciONLxHUHqeLJKJq+CD4x2hs4OkjGzaUV6jT9ZWGPWcTnLip5y1jrFvPRj7AbFWzo/LvoNRrwhURemHjtJAxyibgWgwamoE6IGeUz/pEOx0TLpB0mTdFnqEqDiNL6+vxcL+eLV00iauc4TyO/HcTp9B3tvNuAqC2DA3IytPxvGZBGYgevqz7ZSCfPlcwoySCKvYTZ6B0YziW8FMoLtwrHyQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27UtitHgMoL3ZOixqA21hWtjrGT4gJwLsHe2Mz58dTg=;
 b=lnW7xyV0dalqaQNxQivKO7xx1xSCunIvSNFJIrnQV4pKO6Mz9dZc6pW9XQmPRv0vfHmSfcIlGXzxQVQzmNwUl3ZoqFts+SvQM0LjN3u3KbskTwnppZVEXChsNI7ambJInyrtFY7oBVJKdPaNVl6AhGZZOMfmQu0WAcEyOFJ1TM1aOW0Q0ri46W6ucxpc4NKbJYLlLZwOk+usb0MF0Q9+/XE9Tby0Rp/uVuTOIIYd8S6C46A2i+NXerIhLi7qu0uR8+q3/qKneGQYl/DQOwU75h22eefSb33z6qjx4zIvxuhvcY0xO+jUI4YGi/zE1dJDR6xowBvBRxHHbl0G1TBtaw==
Received: from BN0PR04CA0045.namprd04.prod.outlook.com (2603:10b6:408:e8::20)
 by BL3PR12MB6401.namprd12.prod.outlook.com (2603:10b6:208:3b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 17:08:00 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::50) by BN0PR04CA0045.outlook.office365.com
 (2603:10b6:408:e8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 17:08:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 17:08:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Sep
 2024 10:07:40 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 10 Sep 2024 10:07:38 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH] admin: Enable driver to send admin commands before DRIVER_OK
Date: Tue, 10 Sep 2024 20:07:23 +0300
Message-ID: <20240910170723.44537-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|BL3PR12MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: b83bc1c7-5c4a-4ae8-6238-08dcd1bb1fc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DrV38AP3z4OVSe6od/MozoyRk0YF2q09RSHV2GwOztOMc5Bp+yZ/+TmCbkCP?=
 =?us-ascii?Q?aCQ1UpMM0u1p2IibmivGN3fpCjJ9bulVPb+9RT4GZiLKS9JT+OKqZifssp52?=
 =?us-ascii?Q?efBChGD5UnMLHfAy9NrlsO3VIBYHTEcE8hlJGnhVTwoKHwUnJ+KEVkZNHojD?=
 =?us-ascii?Q?iLM3SUPIe5crh3ojI1CNPU91t3vj1oiM3qzuWfTKYc1GGhDlBxX72NNY8y/D?=
 =?us-ascii?Q?jckD83s3+3VgYOil/QKiDvLvERq/eGKZJmR+IfJLouuWgsYp/3v1fbz0IN+E?=
 =?us-ascii?Q?yKeYnc/viD8gXdAZHOqE5Gu60qVdZNMdA7mlJMpiWpiZuLW5WDM4/cXPxKOW?=
 =?us-ascii?Q?pXl5oQ5MPaHZDw3yc5mAS/YpVXwul0qg8RP/aobgIyzMMmMyHVnNG0MplGUA?=
 =?us-ascii?Q?fptCf695L3kkHbkEfqRx9zd1FfGZoeLhcAvyawOqfPCCXUrH+S6vGoaLIngJ?=
 =?us-ascii?Q?2aMd5tb/SMbUH2i/OxJjAgLMv027OHNJSh1qq2OdEvCeXIG+vUCVdShOaW9h?=
 =?us-ascii?Q?Q93HtfMsyL92mX3eQG9r1wqaz77OTOB4JKDHM52FX9Nj1wJJ1Z0emUq3+BXu?=
 =?us-ascii?Q?zFGNB1cF1A16MILAs5HEUsRK2fXVOhoiwD8doIljaseB3E3MTIXoM7ghTXOv?=
 =?us-ascii?Q?4rsc626sb0I3bNYJkZM+NS6cbRhFFIfIOYzIJ3JiWpm+VXLIWmC3eJCnIaYI?=
 =?us-ascii?Q?XieptQ1esuMYEHyyM8lDF7qkpA43Af0cVl1k3zHSpk1G6+7g795Aw2eGvnRB?=
 =?us-ascii?Q?2HC4jsQ4xh42eOKgq28KsK6p4SQz57p6xWf2SxNl61PkS3ed2c6AVCjHaHBT?=
 =?us-ascii?Q?dL/9Tsyv7BRtsd4IMyvXNtgmAO0zr2zjfJp3CTS49ARim1CUx4bfp/p9DvM4?=
 =?us-ascii?Q?4iJsfif6CP4JD/pfYZGi4SHc+fq8d2F1LnWgGiCrBG2oYvTAnSRC7fSISudm?=
 =?us-ascii?Q?mnNykXJBPwCkjVJzKflFc++0v/WuELRHNAuq9RrZVXKsMhGemtJsrzRUEvn+?=
 =?us-ascii?Q?wwL8DR4TKzgzc+UX623/7uZc4mLOuVBcqWQb+JCIPNA+Wa15t5CXgnSQEvcG?=
 =?us-ascii?Q?mNsLs+iKZmVNMQmTcmBVIBfQ/mIF/yw3qp3o9/pBUUmfo7YoumZ5Lssm7mx1?=
 =?us-ascii?Q?+W04vF/1YXK4W3cEJduMnwp3ZV8D+UpY26wxnWxDPhb/TyvLgs9YGzFqPI7T?=
 =?us-ascii?Q?B2/+cbb2j+JP0xXfo1XsQDnEHavreHaHP6cBcLbR0V2pB5Mp+2QH+QmnnAlX?=
 =?us-ascii?Q?uOOJ2wKkozz5l07GoM8VsDYPRuyZz++DvOYaPMrif0qs422Q0R52cVnYeMgo?=
 =?us-ascii?Q?kTzD+sCob0n3Tr6tPR0Ef5tJ6EOCdzKXxVU3gx2FyCvA0QGwgmHqJrhxcNgR?=
 =?us-ascii?Q?IlNbaJ7BPh0rtZuW0ri30zhd3eNamfC99ofbS2L8XSSUyxDu9P7G8t/yuUm3?=
 =?us-ascii?Q?0cNWJFLQLhM0WwJwgifUtW8dlyU/iPCR?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 17:08:00.0208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b83bc1c7-5c4a-4ae8-6238-08dcd1bb1fc8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6401

Currently the driver can operate administration commands using
administration virtqueues. Administration virtqueues must be
enabled before it reached DRIVER_OK stage similar to all other
queues. This is a limiting factor.

Many of the device functionalties needs to be discovered and
configured early enough before the driver reaches the
DRIVER_OK stage. Some examples are:

a. driver wants to dynamically create the virtqueues of virtio-net
   device with more parameters, for example header data split,
   multiple physical addresses.
   Here, the driver needs to tell PCI device early enough that it no
   longer uses queue_* registers for non admin queues.

b. driver wants to discover these features and related attributes
   early enough so it has chance to decide to proceed via admin
   cmd interface or proceed to DRIVER_OK and follow the current flow.

To overcome these limitations, introduce a feature bit that enables
the driver to send capabilities related admin commands before DRIVER_OK
via the available interface such as administration virtqueue.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex         | 16 ++++++++++++++++
 content.tex       | 13 ++++++++++++-
 transport-pci.tex |  6 ++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/admin.tex b/admin.tex
index 39fc072..95054ed 100644
--- a/admin.tex
+++ b/admin.tex
@@ -334,6 +334,11 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 supporting multiple group types, the list of supported commands
 might differ between different group types.
 
+When the driver has negotiated the feature VIRTIO_F_EARLY_CAP_ADMIN_CMD, the
+driver can use administration commands VIRTIO_ADMIN_CMD_LIST_QUERY,
+VIRTIO_ADMIN_CMD_LIST_USE and commands related to device and driver capabilities
+listed in \ref[sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities]{device and driver capabilities} for the self-group type before the driver indicates DRIVER_OK status to the device.
+
 \input{admin-cmds-legacy-interface.tex}
 \input{admin-cmds-capabilities.tex}
 \input{admin-cmds-resource-objects.tex}
@@ -608,6 +613,14 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
 or VIRTIO_ADMIN_STATUS_ENOMEM, then the command MUST NOT
 have any side effects, making it safe to retry.
 
+If VIRTIO_F_EARLY_CAP_ADMIN_CMD feature is negotiated, the device MUST process
+administration commands related to device and driver capabilities before the
+driver indicates DRIVER_OK to the device.
+
+If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_CAP_ADMIN_CMD features are negotiated,
+the device MUST be able to generate notifications related to the administration
+virtqueue before the driver indicates DRIVER_OK to the device.
+
 \drivernormative{\subsection}{Group administration commands}{Basic Facilities of a Virtio Device / Administration virtqueues}
 
 The driver MAY supply device-readable or device-writeable parts
@@ -641,3 +654,6 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
 
 The driver SHOULD retry a command that completed with
 \field{status} VIRTIO_ADMIN_STATUS_EAGAIN.
+
+When the VIRTIO_F_EARLY_ADMIN_CMD feature is negotiated, the driver MAY send commands
+only to the first administration queue defined by the specific transport.
diff --git a/content.tex b/content.tex
index c32c218..12f9224 100644
--- a/content.tex
+++ b/content.tex
@@ -540,6 +540,8 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
    device, optional per-bus setup, reading and possibly writing the
    device's virtio configuration space, and population of virtqueues.
 
+\item\label{itm:General Initialization And Device Operation / Device Initialization / Capabilities Access} Optionally get device capabilities and set driver capabilities if VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
+
 \item\label{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At this point the device is
    ``live''.
 \end{enumerate}
@@ -550,7 +552,9 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
 driver MUST NOT continue initialization in that case.
 
 The driver MUST NOT send any buffer available notifications to
-the device before setting DRIVER_OK.
+the device before setting DRIVER_OK; however, the driver MAY send
+buffer available notifications before setting DRIVER_OK if
+VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
 
 \subsection{Legacy Interface: Device Initialization}\label{sec:General Initialization And Device Operation / Device Initialization / Legacy Interface: Device Initialization}
 Legacy devices did not support the FEATURES_OK status bit, and thus did
@@ -879,6 +883,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_EARLY_CAP_ADMIN_CMD(42)] This feature indicates that the device
+   exposes an administration command interface which is accessible to the driver
+   before the driver indicates DRIVER_OK device status. When this feature is
+   negotiated, once the the administration commands interface is configured, it can be
+   used by the driver to issue administration commands related to device and driver
+   capabilities.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
diff --git a/transport-pci.tex b/transport-pci.tex
index 95b08b8..a612b34 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -495,6 +495,12 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 to ensure that indices of valid admin queues fit into
 a 16 bit range beyond all other virtqueues.
 
+If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_ADMIN_CMD has been negotiated,
+the device MUST support administration commands through the
+administration virtqueue identified by the \field{admin_queue_index}
+after the administration virtqueue is enabled and
+before the driver sets DRIVER_OK to the \field{device_status}.
+
 \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
 
 The driver MUST NOT write to \field{device_feature}, \field{num_queues},
-- 
2.34.1

