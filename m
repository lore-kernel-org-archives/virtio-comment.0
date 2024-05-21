Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D32B6CDAF
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294670; cv=fail; b=BaAy39XpfdpKhkKljz/mYw8I3ZuMG9C2f5yUf1WElkzFCJwC8F7IAPDSYNbEVavyfAPATEmThNpQDuj3gUs6p/xn3AhOfPyJo8xMe2tdG/a+7K8k1+W2KGzjzm2EJyqveXtgGSLdNCxF8ZsjHSghyEp7gfmrUhg9pXbByDqFIOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294670; c=relaxed/simple;
	bh=VT9hwIDB/uA5bpo9K3nH5AoF/crzZSax86Vj2VjxFkk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GgJfH2/aYXqV2HKBGQD5svnl8xL9ZY46hFpNfT4DuP7qD0PZWlvq6Yb3h4i6SLVsHunw05Fy6b8ZVcFE7lXKkDU7ReKhOnf8T8vZCy08+PYzWS3mrlBXNtmSWk/V86GO6B580geXms8MlWv5IWnq9bOn1kKjYue2oF3LtES0IBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kF+yuqZC; arc=fail smtp.client-ip=40.107.93.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kF+yuqZC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtFkPGu+sOq4AtPz60YPISL8c0PAqFENnrQpEzhao3/J0UrIMOSWLO7/Fyuo5KhA3VV4vkFNHpMgZa//p4JdVBJVb0dXLkYWg7SKpqibn1HYZZIspaO5LRUk1PUFc+DB/MPEIrokwvKlconbL9d6b1ZhHr9nDN8/vKWmpsuy4fFN9GwUBBCK02iuyr9N0jAxmTX1p48pISyGLpcCeUPH17MUdBglGA45D+lnlk3LnXGzmHhikxDDKbjv64IxPP6WVHeo4ZJ92Zv5S+8nGlmiz2EqpptuNNg1+4OD4QHIy1HT++R5iCCJdrFbiQOwXMXXI82Vrw7+ns5yJO7xVxbeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0knrFeFhDRlsjXr7wxdms4oW9WdeTEUwZKWDkiRKwA=;
 b=LwzgVQQl5QbDU+l4R33a9QKNvzmdxeRi+jMqF14WY7GjdbbuO54qaFdDhyo1r+4LJ94/CT8IvgG1yrJCu9t6hGeIrD4zdqrJO1Gtii0w1eGbRCL/TWLwldGRV1q29LuCDV5n8YCplJXoMuEwEKI/ourmQS382zDnBK5MIORAIG/0oy7txM+Z1vCHncZrDFyBAbnIz3bxQyEm3njWcGB1BehR4OqTjbhPhWoX5WfK1mr/seYCLH7BVtbJ0TQfVl6WczAVRUOwRvhnHmH390FEdnIxtueRa0cNiRdEZU1Xedc4RzZvmgaKM3Bjmj0woikCZO07wPaOGyQ0vHx33L/jtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0knrFeFhDRlsjXr7wxdms4oW9WdeTEUwZKWDkiRKwA=;
 b=kF+yuqZCr4iVA3awQlQlaWqBa6Vp2fCLMYmJcOCPync3zladnmtIqm13xEvrfWYwnraYh4SCEdUX/lr8u41Qb9t2LpobHVNnmnTxIFf8LlFeozqrmRpgNUI0me8kGXUVchbdO2dPOC+P8V5ApWRD4DZ2rB214EDubFVBIIW4tw6qYvFepTlV0DztR4WSa2FBo0te/HzDWqcpjDMLts5otvwMs/ZaM7piA6b2YGq2GuVSY+uNQzWTkRbnYNRl2X+wNscYXfDLaEnHGTo/d7+swedx3dalTP5QAuM+ZIBR9xvOpzrPS/Xh8qWEPZIlrf6w7OXwgrzrIHGjDAOWvERQ4A==
Received: from MN2PR15CA0017.namprd15.prod.outlook.com (2603:10b6:208:1b4::30)
 by CY5PR12MB6129.namprd12.prod.outlook.com (2603:10b6:930:27::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Tue, 21 May
 2024 12:31:05 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:1b4:cafe::ac) by MN2PR15CA0017.outlook.office365.com
 (2603:10b6:208:1b4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34 via Frontend
 Transport; Tue, 21 May 2024 12:31:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:31:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:30:40 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:30:37 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 13/13] newdevice: Extend informative guidance on capability, resource objects
Date: Tue, 21 May 2024 15:29:37 +0300
Message-ID: <20240521122937.2004180-14-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521122937.2004180-1-parav@nvidia.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|CY5PR12MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 261a4500-91b6-4ab3-805c-08dc7991e202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zv+S0EiR9kWRmyjHo+4Yan7lwVFIQj4hJYTzO6+YQZOb3j/hyTSdFBOfpGLp?=
 =?us-ascii?Q?sVltq12/Yv+0voGMgS08sA/ANMeEkasZh4QtvmSo5M7mEbfKWeozkBOQqEht?=
 =?us-ascii?Q?/zu3C0vgiCcug5GTHUqaHKbZHBAHuboGqIZpLMwp//8LzwWQ+6quY8CtV0Kw?=
 =?us-ascii?Q?gzXbQUh5OQYjBwARtjsUIBgfoCUrgOw7F8gKn+/h3aFPFct7T9RCMXEqX7p7?=
 =?us-ascii?Q?y5RMm5ZyGoPmecrLlAICsRGgB9wXrsix8pC9Z9xpSUiO2NHOAFyAv/5u2UYD?=
 =?us-ascii?Q?LPM0NYgS/ug0KeB21SESnbVum3WAKoMcn7sGjMFWNzCwSRqstXwhDyNImd0o?=
 =?us-ascii?Q?H3tD36jo2RRtc58P3B8Ac0CLXpjQUBTzqm9VVadvC0vUF6M/X056UlEa2DW+?=
 =?us-ascii?Q?yyC5M6pBWzBhT7tcQEy1wO9j85B7MDS7zA/4/ds5oGrTEdnedLOMAJK3/EGk?=
 =?us-ascii?Q?v7LiXJ3AFvI9lx5dz6RP4yp97omR/JnCQp+ZZMeHpBOl22a1ZyH8y1beyv2m?=
 =?us-ascii?Q?4SMgbFUGQka6A2UnQ2hMHvDhoaMl8pssNu1vFjqEdLVDOAseH8WhqpqSWtnY?=
 =?us-ascii?Q?hJxgxsBwSE0IJp4Mau7oGVguOBrTAwmyp1RluyRxKbpXzEIvniHmUSzEYL5P?=
 =?us-ascii?Q?hAH/vapt8u63FLnfY20WGRhgDEywrI0eeSZZwGx5GWfnrt+iPJT/NynLPOb0?=
 =?us-ascii?Q?kn/W3xvSsemxyohpaxFA0crVhpjederUG2cEVxnR2oB4GWCkJPnnfJlxnNgS?=
 =?us-ascii?Q?sQq8CigmP6OvBYTh8zjCT0Q7BL8OxLJrK5TFuGSpbHhnxgk5tRWgfk8SvnFc?=
 =?us-ascii?Q?ZMrzmtRCbzWBNKsd2Cy+xNNEgcL+S7jNpDjY9vSf1ANiIWFVfmx0nSGaB5mV?=
 =?us-ascii?Q?f6RR1U09Nlj4SYK6NHiQrevT6hECQ94hm2gxMVOkh+vzZ77YgMfl893hovjN?=
 =?us-ascii?Q?QnJM3fuIeB2bnkc3vLX8aqqOvizcQuwNFuPPyhjYAjEpCeNXF99oVCNOp8es?=
 =?us-ascii?Q?mGoogRwc7cwg2pT53vF8UYOkerQ8fQOF4KlOyxgSz7ERae6n8/DvsUngFKAW?=
 =?us-ascii?Q?rQFGqPze76uxUXb2YELS2MObkoM1BwwL9JNp/JKeLwa/BBgSG0T044r6dduh?=
 =?us-ascii?Q?KAMciq7ZTFhWTv7m8HrxuCUciI3HXdb68/41+YxPQ6LvJXSgHRc9mfcMFW91?=
 =?us-ascii?Q?yMdZYJwhA6nFMIFShhy9n7gIayvUWcLNMhiYEssjWmthnrLMbq1R/VksLCFL?=
 =?us-ascii?Q?kbvk2QYFJEZJpIiF1xDZKLczv01Ydvrk+ZGbM9U4IjkF2sp2VK7LKVI3Epzh?=
 =?us-ascii?Q?E26tIuh/trx6TEdWA3Mohk0XOAlL20xQF5TJ72WD3HVBplOb8fBpW9XIOqCI?=
 =?us-ascii?Q?tjkSYNsvHbexQ2pz4YOcJFPgXV9x?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:31:04.6613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 261a4500-91b6-4ab3-805c-08dc7991e202
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6129

Add few informative guidance/notes about which use cases to use
device and driver capabilities and device resource objects.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
internal changelog:
- only sending last patch-12 to avoid the flood
- added back resource limit sentence along with resource object
- replaced administrative -> administration
- replaced admin virtqueue -> administration virtqueue
- replaced admin -> administration
- replaced utilize -> use
changelog:
v9->v10:
- updated examples
v7->v8:
- improved the examples and text for usage of device capabilities
  and device resources
- added more Q&A to clarify the resources and capabilities
---
 newdevice.tex | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/newdevice.tex b/newdevice.tex
index 93feb71..f934414 100644
--- a/newdevice.tex
+++ b/newdevice.tex
@@ -26,6 +26,27 @@ \section{What Device Configuration Space Layout?}\label{sec:Creating New Device
 writable by the driver.  Therefore, no writeable field which triggers an
 action ought to be wider than 32 bits.
 
+\section{When to use device resource object?}\label{sec:Creating New Device Types or Extending the Device / When to use device resource object?}
+Device resource objects are best suited to represent device resources used
+dynamically by the driver. Limits on resource usage appear as limit
+fields in a device capability.
+
+\section{When to use the capabilities?}\label{sec:Creating New Device Types or Extending the Device / When to use the capabilities?}
+Capabilities allow the device and the driver to negotiate support and resources
+used for specific functionality. For example, for a networking device, a
+capability can represent the limit on the number of flow filter groups. In
+another example, a capability can represent the allowed flow filter classifiers.
+
+\section{When to use administration virtqueue vs control virtqueue?}\label{sec:Creating New Device Types or Extending the Device / When to use administration virtqueue vs control virtqueue?}
+Any new device configuration, through device capabilities and resources as
+either implicit or driver-created resource objects, should preferably use
+administration commands via the administration virtqueue. Furthermore, even for devices with a
+control virtqueue for configuration, implementing new functionality using
+administration commands that leverage generic infrastructure is desirable.
+
+Future enhancements may involve provisioning member devices using
+standardized administration commands that reuse existing capability structures.
+
 \section{What Device Number?}\label{sec:Creating New Device Types or Extending the Device / What Device Number?}
 
 Device numbers for the new devices can be reserved by the OASIS committee: email
-- 
2.34.1

