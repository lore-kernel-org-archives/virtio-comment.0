Return-Path: <virtio-comment-return-8049-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20002C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:21:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8A9842A83C
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:21:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7ACC3986B5B
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:21:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6E594986B34; Mon, 30 Oct 2023 13:21:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C542E986B35
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 13:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZZVwdyS16lTekNLl8IoIbbcBx0ryaOUuuvqjuNLL6qkcxvqE/d1WfDa3eFxqISQKsG/QIgIL114dpqUi6fHDyEexnInTP4boveJzHkeKzi9w55EvVIVM+4Ksw18pYisfrA/rZ5kVFFgS4s/MS9lTKcPKS5/fi36iohvKPcTBPBsn14MEbUhlkYMDMRf3fKXEVM0l2+30HZcDzwGPUR5TJ07dUQN91Csave9v/HvjhgzlAXQjPxyr4CczbogYTIJY2UKheHLZTsyYvkmXjgqB9k6dUdcp11jCZm9VecUv0pGbjDLpPXZZVs/5Yw6akVfZpDOFmR06BTyPRG3ib12Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wo414zpxzKIstJKFvOxX3/JAQ0KsWsYpm0UVa2Sd6tQ=;
 b=GnRpr6w2o/BaED1H9hGQZgyjnjH2nWzzbQ/Ma7a9zrzgvI1GfqH4yD2rvED0Nh2mzyrkPS5jWVmXReBNrxzxS0qzGPXKBLGqNbIBosPFQp090LexXxhUc0doXZ9EQWaVZit2fSNd4dPKR/AXcZMWR5MwWg7etG7D75C4Q0mPeULY3bnam9p3dX4ZCDeL/5ORiHligo3R9f9oKz5+89qGD0aXzOgIGSNTeTNY9DUadnHLydfEzeyzpWtSepojdVjo/Y98lFgOrSffYaur8MwPV55FCTE9L+nTudj86mj4ny4A1dLIkJPWB4wRp51B7WLSTCZ3qGaswN+Iwh2x2CuU9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, <lingshan.zhu@intel.com>, <jasowang@redhat.com>, "Parav
 Pandit" <parav@nvidia.com>
Date: Mon, 30 Oct 2023 15:19:59 +0200
Message-ID: <20231030131959.1386107-9-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231030131959.1386107-1-parav@nvidia.com>
References: <20231030131959.1386107-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|SJ2PR12MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: d350e336-3598-4812-4afd-08dbd94b0b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v3FE+TZ/s4gg5lxn3GKiztaaDBNKEnxH+k4cPHm39E6k4wnM0Fo19B2FdjtGRihqI84LtkHG8KvVy7ucJFSI3FqQm7Hy0U2yZGcQpTUsYOy2dlV4hLO+4ilJj9VH6Koz7KlCB+Nz6hmzCoOvS2TISZKQJ4V6nCBqudAZYATLPrE0D7XuQRqTEb5L3VYQyvWePrhJEzMtIj1vhQr9L4PyY+uNk7aZDV8zqQQixj85Gk2vq22ejp7VehL/0iVY7NRKbLZeCzUrRyEZkOh7QVRi2Wahyw+wYQiup9nTUOn0TLOLrdVQKgdVkUmvbU8LWnLuUT69RvC+gJMHdDMASNso2EgN73B2tT4XYzkiMsY/d8H7T2p1D1dpbKpyA9PGSVnSRQfVA4Kjbu34xuhJduowDk+P8HijxKFaQ6CrlYYsyXlKcBTzCEoIG+0hKw9U0uHhH/kLvox5uVZBW60biqMGr65r42xprG1ar2vvHmpWAdK3GkJNYQ89ISqFgdTYm95ZwViMwwEm7qT889UQEaNo3OFsCfU6+F1EFyrSdvZDszTt7czUXdaP7o1Sf0/GEd1Ixxq7BZKqTTmUrh9nPOahiwjtMalHQDg3J2IIp+q4DOa/sNyarvzoABm/+JX289gQkfKYYO7jW2FKDsfSy2dBSQtlci36and3qnY8XEbxT4NUOFYX37lFu08wEC+5zoC8F9XhUZPkzKgvqbubeG25h6DgwK5L15b19loDDCGme2O7VWSPBFf0kIvv0n3F7hgXDDa7udAPEMS0q8nW030HENNaz4GreMQ+eb/00VWW4mE=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(82310400011)(186009)(64100799003)(36840700001)(46966006)(40470700004)(26005)(16526019)(1076003)(2616005)(107886003)(40460700003)(7636003)(356005)(36756003)(86362001)(82740400003)(47076005)(36860700001)(336012)(426003)(40480700001)(83380400001)(5660300002)(316002)(70586007)(41300700001)(70206006)(110136005)(54906003)(8936002)(4326008)(8676002)(6666004)(2906002)(966005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:20:54.1798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d350e336-3598-4812-4afd-08dbd94b0b98
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7867
Subject: [virtio-comment] [PATCH v3 8/8] admin: Add requirements of write reporting commands

Add device and driver requirements for the write reporting commands.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
- addressed comments from Michael
- renamed iova range to a page
- removed duplicate device requirement
- allow stopping write recording multiple times even if it is stopped
  so migration driver can start cleanly at beginning
---
 admin-cmds-device-migration.tex | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index f6c2881..59b946a 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -604,6 +604,34 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 VIRTIO_DEV_CTX_END_MARKER in single command response.
 \end{itemize}
 
+A device MUST either support all of, or none of
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY,
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START,
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP and
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ commands.
+
+If the device supports VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY
+command, the device MUST set minimum one bit in the
+\field{supported_page_size_bitmap} and set non zero value in the
+\field{supported_ranges}.
+
+The device MUST fail VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ command
+if the write recording is not started by the driver.
+
+The device MUST complete VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP command
+successfully, even if the write recording is not started by the driver
+or write recording is already stopped previously.
+
+For the SR-IOV group type, for the VF member device, VF function level
+reset (FLR) MUST NOT stop write recording on the VF device and it MUST NOT
+clear any write records already gathered by the owner device.
+
+The device MUST clear the write records which are returned in the
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ result. After command completion
+of VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ if new write record is created
+for the same page, the device MUST report such a write record as
+new entry.
+
 \drivernormative{\paragraph}{Device Migration}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration}
 
 The driver SHOULD read the complete device context using one or multiple
@@ -634,3 +662,11 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 For the command VIRTIO_ADMIN_CMD_DEV_CTX_WRITE, the driver MUST
 end the device context \field{struct virtio_dev_ctx}, with last
 entry of \field{fields[]} with type VIRTIO_DEV_CTX_END_MARKER.
+
+The driver MUST NOT invoke VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
+for overlapping page ranges, each page range supplied in the command
+MUST be supply unique ranges.
+
+If the write recording is started by the driver using
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START commands, the driver MUST explicitly
+stop the wrie recording using VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP command.
-- 
2.34.1


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

