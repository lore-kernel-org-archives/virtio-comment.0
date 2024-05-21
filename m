Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525056CDAF
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294627; cv=fail; b=EM/UCbShwPW8eUHsNwlBv7/y7adSuV+AeX8jR6Tfn13Y1wdaEBXozpWkYKwpyW7gOVDgQJSsx9fQldnpByXwetw13nby2h1YEGi4nyn1iVESPtIrz6dVLGe2nm5s1K4+Ykz+jd8zom6+qJNZQ6njYYIQ9XD4ABSoWZ4K5ZbgUbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294627; c=relaxed/simple;
	bh=QEaMVG3AWj8OHarbGgUbF1oyjNbEZ/0f/bzJDdVPVug=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fS1D0IbemlLl+i8ns7+tGm1isSppSzNQnigXgbRM9G49g3+4bMgcdpPqCX9JxW4a0hdV9+w/bLIP0t07a8lIP4pAoSyaU9gq19w65jjXxiTTKlXsi03cbNY673T82YU50o44tdlSXElO0T3SQNV/PrO8rc9YAfHsix2V1eB8mMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DLOdccgN; arc=fail smtp.client-ip=40.107.95.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DLOdccgN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbrIlbMGYAT0+RIK1JV7ewcGHtNhRKhPmvaEK1JWG4Z6jTXSF081KXAdUcHStxgB8c3CGh2wjsr3L2pqCHmuDxrS6NkDwO522BwYsH85avg64xGQFO9xX0EZEy03OFIUtEXP4N6rjtDTE5iW5a8chL1kEXQ7JvIJJS9mmyq7mQof3wxsi/XTEKxcsjcofCtw/XY7GH0MGLwdHHCqXEXIDouwMnaUls7NGFTqos6zs5NHXZuvMpRxx1jdZLdRwxHUP1ji3omBWyVowMvB7T9UpPmEmUaHJLQdKhYAmYSqDT6YD41K7KD2sp6e1SxqChHHQzz0VVwL83KP/qbzWP+jjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bshnb18KHnGyQkLQ8TeTbWkVp/zWb84xdcfukUKJ3Fo=;
 b=JAzA0oBYwgucFu1U68KfI8BsYQKfy+DrM9f7ow7yCHM0vcFi8uq67q2gS4dXC/kEiUa9KkTzJxAZOAi8MRrfWh+TEe2tu/RtdTrdmmWvyTwCwS4xEd8thafbM3dRbYgvTjwD2EPqVWUQsyhWMFXx7el74WtJ/ebtNu6OLW9FCG18Zo6Rl2XCSSnmQxgzLeur7EjDXgRwcJE6liEX2yDSkpwGcIkmvcm6GWEkkJyxLEyplyq1qg/vfS2IlVgSdGGufSwuPewBopkjZwX3Zdr5C2VioZjMZvwemvpGL/ILMU8lFJpAG0HnAhZnuFLDdEY4XvZrh7wyYdMUCNIfSwuEvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bshnb18KHnGyQkLQ8TeTbWkVp/zWb84xdcfukUKJ3Fo=;
 b=DLOdccgNuONu5B6eSlVuO0OTfX4I1VtxXX97T9u8UfP4yXfVangFAaYytOEtCpRnhn/OdVhiPRZERAI4+jC61P0Ge4HyJqzQigDIpifz2O1WwwAIL16A14Tb8Qpj/Pfws3S47BaVa2BXN3eGRqUoNdQh5PC+Tg5xQ4BzZvn8bmttwszZjDuy4r/cvKTzGcf//SEB8tSJ9t/ALgMxFo5PKtAZfl1o+9xqWDn/QRzgz6Rvsitr8Cm7cAOIQEt/TvE+3Pb3GXGqm7wI+R+3O8MfDE2xCqn7Vb+9s3OW07qUJqNvFSD1+4Veybi6844WwtEPsZl6tkRiWgbpxi1Kzv0Nkw==
Received: from SA9P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::11)
 by PH7PR12MB5878.namprd12.prod.outlook.com (2603:10b6:510:1d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 12:30:21 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:26:cafe::fc) by SA9P223CA0006.outlook.office365.com
 (2603:10b6:806:26::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Tue, 21 May 2024 12:30:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:30:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:30:04 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:30:01 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 03/13] admin: Add theory of operation for capability admin commands
Date: Tue, 21 May 2024 15:29:27 +0300
Message-ID: <20240521122937.2004180-4-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|PH7PR12MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: e6632cd9-a345-4d20-0b8a-08dc7991c848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?voCKUvQ8xQbw18Z4FxEN566qqE/f/XWf+xQge3pyxlUkPfbEh8c4jDqar3Es?=
 =?us-ascii?Q?IcMjRw1lLr95HagLuemI0VvnHswZpesJE04H/Pzmitnd+dnJI/qgFHdA1Y4v?=
 =?us-ascii?Q?3aEOlMmBAG0yIF/A8qOVHLeXwfczbBqMJS5cN4w2StxXFomwR0gbpjig1y7c?=
 =?us-ascii?Q?SK7Gvs5l0QdloXKmz7e3xKaKNIt3+iJbE0DR9C4BCCjRdmPPHp4hO49IWr81?=
 =?us-ascii?Q?TzUiWrqfnQwCe2RjvKUCeSOucNvVX2Ey35IdkM4OtePdq6lV87Gko47Jj9p1?=
 =?us-ascii?Q?5ET8OPGMWfxqNQCZIu5UfiUHVOpkLIlSMpQBohRy3IZQxEq1ZM3tAlj+Fv9G?=
 =?us-ascii?Q?o0bw+ri5Uak1McEWjH+lW7pFNpiuspOPsUWJS9xgbu8OKkiI2tXGWtBIuV+L?=
 =?us-ascii?Q?oQMdCnHjFzqUPX3cNDSLoV+8zY5SpXXKQXhRrkbuKGWJNRLuTUA8b1oGPuYa?=
 =?us-ascii?Q?ux6Hjl3Lkzj+FsWLxtzZF5LLsU6X0kfFyZArfpOEaONhAzRXqZfPc5NjkRJL?=
 =?us-ascii?Q?wGnGFIjNtsTom8H6I0hbOTkaXTSaCR4ynHmrGKJds+NhsOV0cBpWKUh99KNl?=
 =?us-ascii?Q?9+Yti12DA6J8r+yVRa9uzOy7Cvh49pd0ObIb1f05M5mZP6Zg2aq83pl41N37?=
 =?us-ascii?Q?eWWS1h+LHcmrOEGe5VkLRscX61uQKqhUfyAe1rwCXnLc+OJPn0wzd226rF0J?=
 =?us-ascii?Q?iv5PdJpG2UMapddX79vKTmxk2qQsE+hFagwUxA0dx4UOTZOL08HFLgUfhXxG?=
 =?us-ascii?Q?uCjEid6iDaxo4gGgXsfvi3qddvwAIBjZO4OPbpfA4PIGd7hQHRzfy19p82s/?=
 =?us-ascii?Q?6GWd2MdA6U6fI8e7wu1YvkTlp8d4fbj6O749k/TbRoFNCTZNSYc+ZaeLeTgf?=
 =?us-ascii?Q?KOD+7CJ1mozs9e2ctb2u1+amYasAOV2e6R0Ziv6Fr0pf+ITdxlXb+bMbZanR?=
 =?us-ascii?Q?UhZDcag4icaG0/gaUCcdwNoNXYE53Ylnn8/mj7UynxXuVdkWVv4vfuz3vmIl?=
 =?us-ascii?Q?sGH8Tmom2qnq2cx4D8eSAB8FUYVhIc35VRXO/IJA6vv4yEu49TV74rFW3rdR?=
 =?us-ascii?Q?BXduDWyHG6Fwyg8LxCpVRkstQLPBTzz3umtCfXv0ZhKDxYlZaMmsw238vEFn?=
 =?us-ascii?Q?XhmBch1nCwETQ3T60Rz3m+bZ370wGL2CrILj09oaQd08WhFbExHEhTj15oBl?=
 =?us-ascii?Q?zR+GCxUo3jRc1SHICvn2dLVmzhpYGBYWrrzPTaH6E9icg66tfD39kog8PWgj?=
 =?us-ascii?Q?a0nOhdiBIQhTWo8NXce8c4rHflm5N9pikXqZf57pEMWgDXUSzI+XJXnu15uA?=
 =?us-ascii?Q?AA24Qo+2rKFvjxjhXHHn07pmBpxgGAUCyvED+XUX3WhgX4sl45ZmA980uI0V?=
 =?us-ascii?Q?Qkd+D4dWPB2frjD14BB5q/FiH5re?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:30:21.5745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6632cd9-a345-4d20-0b8a-08dc7991c848
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5878

Device capability indicates the supported functionality and
resources of the device to the driver.

Driver capability indicates the supported functionality
and resources which driver will be using. Driver capability is
subset of the device capability.

Add theory of operation describing it.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
changelog:
v9->v10:
- replaced 'functionalities' to 'functionality'
- added missing article 'the'
- replaced capabilities to capability
- rephrase for listing for device type specific capabilities
- rephrase the first para description of capabilities
- moved capability type to next patch
---
 admin-cmds-capabilities.tex | 34 ++++++++++++++++++++++++++++++++++
 admin.tex                   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 admin-cmds-capabilities.tex

diff --git a/admin-cmds-capabilities.tex b/admin-cmds-capabilities.tex
new file mode 100644
index 0000000..ef9481c
--- /dev/null
+++ b/admin-cmds-capabilities.tex
@@ -0,0 +1,34 @@
+\subsubsection{Device and driver capabilities}\label{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
+
+Device and driver capabilities are implemented as structured groupings for
+specific device functionality and their related resource objects. The device exposes
+its supported functionality and resource object limits through an administration
+command, utilizing the 'self group type.' Each capability possesses a
+unique ID. Through an administration command, also employing the
+'self group type,' the driver reports the functionality and
+resource object limits it intends to use. Before executing any operations
+related to the capabilities, the driver communicates these
+capabilities to the device. The driver is allowed to set the
+capability at any time, provided there are no pending operations
+at the device level associated with that capability.
+
+The device presents the supported capability IDs to the driver as a bitmap.
+The driver uses the administration command to learn about the
+supported capabilities bitmap.
+
+A capability consists of one or more fields, where each field can be a
+limit number, a bitmap, or an array of entries. In an array field,
+the structure depends on the specific array and the capability type.
+For each bitmap field, the driver sets the desired bits - but only out of
+those bits in a bitmap that the device has presented.
+The driver sets each limit number field to a desired value that
+is smaller than or equal to the value the device presented.
+Similarly, for an array field, the driver sets the desired capability
+entries but only out of the capability entries that the device has presented.
+
+It is anticipated that any necessary new fields for a capability will be
+appended to the structure's end, ensuring both forward and backward
+compatibility between the device and driver. Furthermore, to avoid
+indefinite growth of a single capability, it is expected that new
+functionality will lead to the creation of new capability rather
+than expanding existing ones.
diff --git a/admin.tex b/admin.tex
index 7838301..56c92a6 100644
--- a/admin.tex
+++ b/admin.tex
@@ -306,6 +306,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 might differ between different group types.
 
 \input{admin-cmds-legacy-interface.tex}
+\input{admin-cmds-capabilities.tex}
 
 \devicenormative{\subsubsection}{Group administration commands}{Basic Facilities of a Virtio Device / Device groups / Group administration commands}
 
-- 
2.34.1

