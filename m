Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C2F15219A
	for <virtio-comment@lists.linux.dev>; Sat,  1 Jun 2024 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717253495; cv=fail; b=VKsYgjI0OXINZV3ECouFIoTBuVNuL0KCgg6uMuhfAsyBLQrruLMvEmjBu7CnassabYMB9g+gAG+0HggJjWPtDpesj8LsS+KTdiwnVLRNvbkhVU/LPODrimSDPMp8ENQ+S9+iN16DgY5hgVRzC48qd3BEallsezgiMiPz0b4tLjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717253495; c=relaxed/simple;
	bh=xHzanY23EQif8/m2nfCcNXIeM+wSOi5MnIt4ngZ9FhE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gfeUi7JiJTAtHdURMjlsVqsE7Tnf7OGzkCtU9mmoZXHi38XTuNb3WfoxwZkby+4myxpCKpCF5nXHqfpp1Mc1rTFp9DZjhqR+JsRppgIc18QdpgbH9Ehi2T4ix3yVVfe1CLoASTbFr3NhA7aeoqh3Y+HYgLA0/vOsvYwlhIregco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=owhOtfNm; arc=fail smtp.client-ip=40.107.101.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="owhOtfNm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzK5fJI9rTwfteglrtAhT5NiTa+//CuqWwHPUxzydLRpb0XWNVdKDwFOnfsi4TMlT0JDtr9dvVPrwDXG+VW2SBwJqskmWOUBz6RqE4sz9RukrwBL/RecpT8vdf9/auXgzGc+YiFOArkbiLx9H4WnIFpw2/Byw17pVc0jRPnNsps93FSD6027CVANhxeZ2tLm8aln0Rokovb9JsGdTLqNPE8wNyUjz5Cpy/rpIV/AiypBZHTvZg0j+n0hNtziNyGXC13tSUDg+5gYJbsu10DXzEQy/FEwmaHdJLNCINlpjGI9SpVaF9RyVDt3yQG3edpfGyaUdMFv92e++dsL2X90yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu9n3dGDd0kgW9p3zoKM6/89m76BGyzhHLy+cH9iaF4=;
 b=ZWC8nNWv1YsBEJXursFPcDH+5MA3XdnMuyQovKaIiFDtn4hAYSpGD9AlJ9Ydn2yTe/rzZM4pjbfxX/IXsIlE4reStEGprq6h+PTs0SO34THqxb5oUn3L9jeLg7WirxWZAkR6WUI/5csOTkSmVF4PvsmIh0zjQREmGMjMdh1X+thTy3vXChC6s2S/7jCgDDtHZGXDR8NYzlQPnZK9SZ3XygDr7Ppm2O9zZ+UtPdxyBkd+PWaqVCESasw9ESgsiArnAsiFE6ISd1U6nlSnUUK4H31qXcKgQyxh4K2m/TQZlIt3iuDRLFR8Z9vFwf7U966GpPbR6/M9FGlcAXaUw6FgRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu9n3dGDd0kgW9p3zoKM6/89m76BGyzhHLy+cH9iaF4=;
 b=owhOtfNmmK9DPx+65OMROCt1LBbyZKWe6cYNA6fTCi306VWsJsZEPTHLWL20wvy0QY7tsF+RAsh3ErU8uXKR5nSWl5ufqGdcXqRrNqNKkX681PRw8s+XqujTZA+/niLrD2kqs/yMg3QogSbGEgdVw69R5dzWVe8X7hmxVFsIBZrOv2M+0A+2DqrNiMgwu7u/be3BMmqU72qaIWzwL/JcYngOk1Bm8hNW68jrN7sfZGVSKK1d1230RvgdG5htZdx2NyqDfrXyVAivNo0HCw+VOOEmVP40Z26+chy1ypDW7mqodOosc272FKfprmTuM30PjNLKmELwoXxGMkpPqpgw/g==
Received: from CH2PR14CA0022.namprd14.prod.outlook.com (2603:10b6:610:60::32)
 by PH7PR12MB7915.namprd12.prod.outlook.com (2603:10b6:510:27c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Sat, 1 Jun
 2024 14:51:29 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::13) by CH2PR14CA0022.outlook.office365.com
 (2603:10b6:610:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21 via Frontend
 Transport; Sat, 1 Jun 2024 14:51:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Sat, 1 Jun 2024 14:51:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 1 Jun 2024
 07:51:16 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 1 Jun 2024 07:51:12 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <jasowang@redhat.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<maorg@nvidia.com>, <yishaih@nvidia.com>, <lingshan.zhu@intel.com>, "Parav
 Pandit" <parav@nvidia.com>
Subject: [PATCH v5 3/5] admin: Add admin commands for device parts
Date: Sat, 1 Jun 2024 17:50:40 +0300
Message-ID: <20240601145042.2074739-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240601145042.2074739-1-parav@nvidia.com>
References: <20240601145042.2074739-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|PH7PR12MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: 68468aaa-74b2-4ede-2c9c-08dc824a51eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1REzIZtmMO/sC8X3nF0+aWkVJejBH8rBVHHSoLbbgKrpVabSvs3X+J1OiGup?=
 =?us-ascii?Q?3Y1qn0u7tKPFko8QrCEdEQkfKmuIzsnA7U7Mk6HJubTbcnLfCrjxxV48yXYR?=
 =?us-ascii?Q?BxIse3Xg4SaFIWgw/0Emcz6+BnRLXVQAkxmQHDQKuALydenucLVigiWNyOwc?=
 =?us-ascii?Q?s4aqCo8Pl0s8rxArzlND7b7RKaJOJIDweNgijtQuHAx1TRrt35xHFuxSYU6p?=
 =?us-ascii?Q?k8Sguanr68ozgpQZPZDYNcdmq5ZObYvEOp18n0sZL6BsByS/oDXTXXPK2CdK?=
 =?us-ascii?Q?Pvy1nix5M/SMUbjHjaC/3zxuXr5x5KRc97QLbhPUn2SQ1pxscuGayFgGHzqq?=
 =?us-ascii?Q?zqO6cwr4UVtZneL4i5k8PfIy9g9XeGoBzh5VodWjGMoHb9qmIwLUKqeGO4cN?=
 =?us-ascii?Q?qHAC5zpHKCzACYI2z6OgzyppXsn+LptAnlMjRfujDLfsqTFr3z7rJPG7dNJ9?=
 =?us-ascii?Q?Si3mMV80d5uNWrPmf3ha+VWBwLbV4pKwAf7yZ3uLkJGVpwFFEYb5ZhfRDvqu?=
 =?us-ascii?Q?meKY+nTYWJKS5mnMNkG1CSUWB+CBN+4TUz8TtvCo0g9vxtiT6TA5WZRuCXCD?=
 =?us-ascii?Q?VDcyB9rHnj/osgvkUAKVOnDXXChJ85b+TNxEeTgA7nPGrtJgu0T711Q/1cjl?=
 =?us-ascii?Q?q4Zg9dxZhL0/pvB49OQWX3hVRPY8xjWNR5Tz7B0Olf9nKgxpjTY37ApZ26Cm?=
 =?us-ascii?Q?i+D0C9qhybOZ2xONjU214qONk23PBRHrRTw6UbgAXMHQXmRJUh4rDBRnKy57?=
 =?us-ascii?Q?/Q7Rx9rsRysRPJp42Yy2cpGL5GL57haSwA7dJ539XSOqyAn7SVNdaHpMUwj0?=
 =?us-ascii?Q?ENMzpyXSVdt1iuS8q/idHfVkk3vo5T0GMRx4Xtci+cAsYlFootfuqFBvh433?=
 =?us-ascii?Q?gTuozxDTkyoZH5JMGocycknmTAIkEVk3Kim6w9wLvj4pVxux8/iQcTX/8oe0?=
 =?us-ascii?Q?qheqvGtBwMT49DoPoVT0sVCfLBhSnaiokX20C6qNV13OE/PwuX/Xwn4ruO+D?=
 =?us-ascii?Q?xNF3nu9J0kv5uJM+qQWNmidNglREgcZlJO/5VtXM2T4jPCOqSUKCY11noS/u?=
 =?us-ascii?Q?14/U9P2DlbQb1fv9ihBDuUde4tUA+yfrbm7vBadWOhWTXuaLX4Nj6rmEJTF2?=
 =?us-ascii?Q?ztTC0ewlBU3Shrm9wOBYofe8N6eXX0N007Q6MJbzb+NOaQnLw8CVSfGh+9zr?=
 =?us-ascii?Q?utBQOli59/JtorP+vg92diIW5lbGyBxm1G08Wv8pTt0i/GIqJingGuJzke2K?=
 =?us-ascii?Q?PvhqRkBwYDUhRTLI2qC2bBz6ijYNlT6V9qsncK+9LM7uEeSFNZdTmwz3gD+J?=
 =?us-ascii?Q?T3NvyaDnRlSixFlPsGsJ4U4YE0So21A/u5rpQ2iZlbg/swwtzQPXuAIzxqLj?=
 =?us-ascii?Q?bgFxXmINKgL3Qn8GgsY1Mu5OCnBL?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2024 14:51:29.1762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68468aaa-74b2-4ede-2c9c-08dc824a51eb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7915

Add administration commands to handle device parts such as
get/set device parts, get metadata of the device parts,

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v4->v5:
- using hyperreference to jump to command definition
- rephrase from 'device context' to 'device parts'
- change command headings to match the name from the table
- removed freeze mode
- define marker device parts adjacent to get/set commands
---
 admin-cmds-device-parts.tex     | 229 ++++++++++++++++++++++++++++++++
 admin-cmds-resource-objects.tex |  13 ++
 admin.tex                       |  11 +-
 3 files changed, 252 insertions(+), 1 deletion(-)

diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
index 9cec0ad..36a45d3 100644
--- a/admin-cmds-device-parts.tex
+++ b/admin-cmds-device-parts.tex
@@ -53,3 +53,232 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 resource objects for retrieving the device parts.
 \field{set_parts_resource_objects_limit} indicates the supported device parts
 resource objects for restoring the device parts.
+
+\paragraph{VIRTIO_RESOURCE_OBJ_DEV_PARTS}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO_RESOURCE_OBJ_DEV_PARTS}
+
+A device parts resource object is used to either get or set the device parts.
+Before performing any get or set operation for the device parts, the driver
+creates the device parts resource object
+VIRTIO_RESOURCE_OBJ_DEV_PARTS using the administration command
+\hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}.
+The driver indicates the intended purpose (get or set) at the time of creating the
+device parts resource object.
+For the device parts resource object, both \field{resource_obj_specific_data} and
+\field{resource_obj_specific_result} are in the format
+\field{struct virtio_resource_obj_dev_parts}.
+
+\begin{lstlisting}
+struct virtio_resource_obj_dev_parts {
+        u8 type;
+#define VIRTIO_RESOURCE_OBJ_DEV_PARTS_TYPE_GET 0
+#define VIRTIO_RESOURCE_OBJ_DEV_PARTS_TYPE_SET 1
+        u8 reserved[7];
+};
+\end{lstlisting}
+
+When \field{type} is set to VIRTIO_RESOURCE_OBJ_DEV_PARTS_TYPE_GET,
+the driver can use the object to capture the device parts and the metadata of
+these device parts. When \field{type} is set to
+VIRTIO_RESOURCE_OBJ_DEV_PARTS_TYPE_SET, the driver can use the
+object to restore the device parts.
+
+\paragraph{Device parts handling commands}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands}
+
+The owner driver uses the following resource object handling administration
+commands. These commands are only used for the device parts resource
+object after the driver creates the VIRTIO_RESOURCE_OBJ_DEV_PARTS object.
+These commands are currently only defined for the SR-IOV group type:
+
+\begin{enumerate}
+\item VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET
+\item VIRTIO_ADMIN_CMD_DEV_PARTS_GET
+\item VIRTIO_ADMIN_CMD_DEV_PARTS_SET
+\end{enumerate}
+
+\subparagraph{VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET}
+
+This command obtains the metadata of the device parts. This metadata includes
+the maximum size of the device parts, the count of device parts, and a list of
+the device part headers.
+
+For the command VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET, \field{opcode} is set
+to 0xe. The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_dev_parts_metadata_data}.
+\field{group_member_id} refers to the member device to be accessed.
+The resource object \field{type} in the \field{hdr} is set to
+VIRTIO_RESOURCE_OBJ_DEV_PARTS and \field{id} is set to the ID of the
+device parts resource object.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_dev_parts_metadata_data {
+        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
+        u8 type;
+        u8 reserved[7];
+};
+
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_SIZE 0
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_COUNT 1
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST  2
+
+struct virtio_admin_cmd_dev_parts_metadata_result {
+        union {
+                struct {
+                        le32 size;
+                        le32 reserved;
+                } parts_size;
+                struct {
+                        le32 count;
+                        le32 reserved;
+                } hdr_list_count;
+                {
+                        le32 count;
+                        le32 reserved;
+                        struct virtio_dev_part_hdr hdrs[];
+                } hdr_list;
+        };
+};
+\end{lstlisting}
+
+When the command completes successfully, the
+\field{command_specific_result} is in the format
+\field{struct virtio_admin_cmd_dev_parts_metadata_result}.
+
+When \field{type} is set to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_SIZE,
+the device responds with \field{parts_size}. \field{parts_size.size} indicates
+the maximum size in bytes for all the device parts.
+
+When \field{type} is set to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_COUNT, the
+device responds with \field{hdr_list_count.count}. The
+\field{hdr_list_count.count} indicates an count of
+\field{struct virtio_dev_part_hdr} metadata entries that the device can
+provide when the \field{type} is set to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR
+in a subsequent VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET command.
+
+When \field{type} is set to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR,
+the device responds with \field{hdr_list}. \field{hdr_list}
+indicates the device parts metadata.
+
+\field{reserved} is reserved and set to 0.
+
+The command responds with the \field{status} VIRTIO_ADMIN_STATUS_ENOMEM
+when the size of \field{command_specific_result} is not sufficient enough
+for the response.
+
+\subparagraph{VIRTIO_ADMIN_CMD_DEV_PARTS_GET}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts /  Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_PARTS_GET}
+
+This command captures the device parts. For the command
+VIRTIO_ADMIN_CMD_DEV_PARTS_GET, \field{opcode} is set to 0xf.
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_dev_parts_get_data}.
+\field{group_member_id} refers to the member device to be accessed.
+The resource object \field{type} in the \field{hdr} is set to
+VIRTIO_RESOURCE_OBJ_DEV_PARTS and \field{id} is set to the ID of the
+device parts resource object.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_dev_parts_get_data {
+        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
+        u8 type;
+        u8 reserved[7];
+        struct virtio_dev_part_hdr hdr_list[];
+};
+
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_GET_TYPE_SELECTED 0
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_GET_TYPE_ALL 1
+
+struct virtio_admin_cmd_dev_parts_get_result {
+        struct virtio_dev_part parts[];
+};
+
+\end{lstlisting}
+
+When the driver wants to capture specific device parts, \field{type} is set to
+VIRTIO_ADMIN_CMD_DEV_PARTS_GET_TYPE_SELECTED and \field{hdr_list} is set to the
+device parts of interest.
+
+When the driver wants to retrieve all the device parts, \field{type} is set to
+VIRTIO_ADMIN_CMD_DEV_PARTS_GET_TYPE_ALL, and \field{hdr_list} is empty.
+
+\field{reserved} is reserved and set to 0.
+
+When the command completes successfully, the \field{command_specific_result} is
+in the format \field{struct virtio_admin_cmd_dev_parts_get_result}, containing
+either the selected device parts or all the device parts.
+
+If the requested device part does not exist, the device skips the device part
+without any error.
+
+\subparagraph{VIRTIO_ADMIN_CMD_DEV_PARTS_SET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_PARTS_SET}
+
+This command sets one or multiple device parts. For the command
+VIRTIO_ADMIN_CMD_DEV_PARTS_SET, \field{opcode} is set to 0x10.
+The \field{group_member_id} refers to the member device to be accessed.
+The resource object \field{type} in the \field{hdr} is set to
+VIRTIO_RESOURCE_OBJ_DEV_PARTS and \field{id} is set to the ID of the
+device parts resource object.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_dev_parts_set_data {
+        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
+        struct virtio_dev_part parts[];
+};
+\end{lstlisting}
+
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_dev_parts_set_data}.
+
+This command has no command specific result.
+
+The driver stops the device before setting any device parts.
+
+When the command completes successfully, the device has updated device
+parts to the value supplied in \field{virtio_admin_cmd_dev_parts_set_data}.
+
+The device parts set by this command take effect when the device is resumed
+using the VIRTIO_ADMIN_CMD_DEV_MODE_SET command.
+
+When the command fails with a status other than VIRTIO_ADMIN_STATUS_OK, the
+device does not have any side effects.
+
+\subparagraph{VIRTIO_ADMIN_CMD_DEV_MODE_SET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_MODE_SET}
+
+This command either stops the device from initiating any transport requests or
+resumes the device operation. For the command VIRTIO_ADMIN_CMD_DEV_MODE_SET,
+\field{opcode} is set to 0x11. \field{group_member_id} indicates the member
+device to be accessed.
+
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_dev_mode_set_data}.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_dev_mode_set_data {
+        u8 flags;
+};
+
+#define VIRTIO_ADMIN_CMD_DEV_MODE_F_STOPPED 0
+\end{lstlisting}
+
+This command has no command specific result.
+
+When the command completes successfully and if the \field{flags} field is set
+to VIRTIO_ADMIN_CMD_DEV_MODE_F_STOPPED (bit 0), the device is stopped.
+When the device is stopped, the device stops initiating all transport
+communications, which includes:
+
+\begin{enumerate}
+\item stopping configuration change notifications
+\item stopping all virtqueue notifications
+\item stops accessing all virtqueues and the driver buffer memory
+\end{enumerate}
+
+After the device is stopped, the device parts remain unchanged unless
+the driver initiates any transport requests.
+
+When the device is stopped, it writes back any associated descriptors for all
+observed buffers to prevent out-of-order processing if the device is resumed.
+
+When the command completes successfully and if the \field{flags} field
+is set to zero, the device resumes its operation. If the command completes
+with an error, it does not produce any side effects on the device.
diff --git a/admin-cmds-resource-objects.tex b/admin-cmds-resource-objects.tex
index acba22f..216a283 100644
--- a/admin-cmds-resource-objects.tex
+++ b/admin-cmds-resource-objects.tex
@@ -63,6 +63,19 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 \hline
 \end{tabular}
 
+Following generic resource objects are defined which are described separately.
+
+\begin{xltabular}{\textwidth}{ |X||X|X| }
+\hline
+Resource object type & Name & Description \\
+\hline \hline
+0x000 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO_RESOURCE_OBJ_DEV_PARTS]{VIRTIO_RESOURCE_OBJ_DEV_PARTS} & Device parts object \\
+\hline
+0x001-0x1ff & - & Generic resource object range reserved \\
+\hline
+\hline
+\end{xltabular}
+
 When the device resets, it starts with zero resources of each type; the driver
 can create resources up to the published \field{limit}. The driver can
 destroy and recreate the resource one or multiple times. Upon device reset,
diff --git a/admin.tex b/admin.tex
index 8ac74aa..d60d6f1 100644
--- a/admin.tex
+++ b/admin.tex
@@ -150,7 +150,16 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x000d & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY} & Destroy a device resource object \\
 \hline
-0x000e - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
+0x000e & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts /  Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET]{VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET} & Get the metadata of the device parts \\
+\hline
+0x000f & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_PARTS_GET]{VIRTIO_ADMIN_CMD_DEV_PARTS_GET} & Get the device parts \\
+\hline
+0x0010 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_PARTS_SET]{VIRTIO_ADMIN_CMD_DEV_PARTS_SET} & Set the device parts \\
+\hline
+0x0011 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_MODE_SET]{VIRTIO_ADMIN_CMD_DEV_MODE_SET} & Stop or resume the device \\
+\hline
+\hline
+0x0013 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
 \hline
 0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
 \hline
-- 
2.34.1

