Return-Path: <virtio-comment-return-8320-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB5AC4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6380A217DF
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5C443986D64
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 52FAD986D03; Fri, 10 Nov 2023 12:32:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 45A76986D07
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qmr1ehi3tFail8Id6vhzRtjuYeLfFuuc0Lh9t1SnBn3Nq2F0MsKr8KENmGanz4TwmUmd1KDvK+qkp4eyoQgIRovuA/iGVbEgIW9S5rTRNAg8uCicHiM62ZQsHJB0/Lfy6+motqr7aNCTqvYemhEzVdfK+M6nU3iy9/3pzki5QcIzczsC1SBmvHacirD7bsCCR/u/icncLrv+J5tFgYqQTaJgvaYJFkrkJKaj1/jFdG3ZBW37nytEKVOEfn5EZoZDVhgzL9i7RLKScw5xVXppN3YSGhWIK5TS80OHiggUJMXePakcIDE8il5w+yk4uuSyf2krDbrbuB9foVHSsn2n2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nG8MTa/tNh2vhllJTdQkfQYTIr7QKqxRxOBcmuv74E=;
 b=KFGMaX+SWBqK/qgP7EhgPQKCYZn2qPUll2cxaAUMoWVk+6LVsYH6iEO44889RWvFL9nMfn9GLWju3lo2nnyMYspgBn0kQy8XKYyrEOnCjHcLV0FKF2EV/1iBd7KBse6T71Eleio+v5COiPScLNKUQJMvvYp5KxMjLUxydghRNtowzTpOlclqVWvAy+P12ZkGyUEXqpb8tH4qtP1RSmeqQWJVSgQ42Nv1Co1a8GPAwa3npSKsQ3HFM93KTYE9EQ3SXKad79hjvxjM5Fq6JQ7Yvex4kcnvX6Lee6O8nimHUK/5R1wVL8tSgHWePptu51pkxk6NHaiUMNi0filExcIJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, <lingshan.zhu@intel.com>, <jasowang@redhat.com>, "Parav
 Pandit" <parav@nvidia.com>
Date: Fri, 10 Nov 2023 14:32:00 +0200
Message-ID: <20231110123200.2082779-9-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110123200.2082779-1-parav@nvidia.com>
References: <20231110123200.2082779-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: ba74d776-6368-44be-0e7a-08dbe1e928e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hbXYK9uGVMlOmsaXontZb/v6aBUW7m1THubp+e01W/5ZQYynoeHr4tTc9uDuNn9llySyzt5a5bE6F7/IVpYLwn+4Os2tQAowd8JXBFg3MW7r8Ea1+YsIcyOmh7jZo68gaVO719QA0yjKG31dhcLfTW1l4ocS73T9wcJggkEqciglsNLiIYbI2dbYolXW52t6zxOof9CHVTtK8WCdgOIqHhrZryNHKW8TekUS32thZ/ALurSPd3PDPY2FujdhMJmZb9ialSoXPhp05CbJFIgQ17qmQha5jrkn/8bU8uGOPY6HmSaNkkzcsko4TTiBM2tf7Ah8RcwgjyVK3fn4AJUHVPZMzf5HHv4Sba9wsBlzYuOQ0RFDNBVMD8cpTNwz4vll6KoTXukcHTxu5Cy5XojC6p00OyvdusFR5BlG3wv6gvFwWDdmN9JPu5oPuoOpHmKiAKU7ApfSeCbcEPmJ5dWEiG48ycx9p1nVHLuW1HwMk5MOKpJLBDU0JcFntCbpCt9yPgvQQlFqw88poujj6YQCZjg2xsoFi7+gehOafnAkyUXVa0IgRu+/RVHFm3fIYzVQjJzCg058Pz3rIztlao59OPBp48ID6tKamJP1DGDNMGWmXU2Iq9n/N8k75tdY/+Pln/5+WkVPXApwzPEk5tCeCRaNm3pmuHZAz1r3rWOqPwncF+7eTiRVJYwGmMBw5LDkqo2XUalgLVGleU2EylkpyLoz20sLSxbGqZPpCd2t2AjJstEYAM6Oes5AakA/W3ETcTdjnQf4iCF4yRSqZRYH4y/xGiX2SdK2cBYKOqZDgwA=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(186009)(64100799003)(82310400011)(1800799009)(451199024)(40470700004)(46966006)(36840700001)(83380400001)(426003)(2906002)(336012)(40460700003)(107886003)(1076003)(86362001)(82740400003)(7636003)(16526019)(36756003)(356005)(26005)(47076005)(36860700001)(110136005)(54906003)(2616005)(70206006)(70586007)(966005)(4326008)(8936002)(5660300002)(8676002)(316002)(41300700001)(6666004)(478600001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:32:53.1315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba74d776-6368-44be-0e7a-08dbe1e928e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346
Subject: [virtio-comment] [PATCH v4 8/8] admin: Add requirements of write reporting commands

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
index c5ca83b..3f3d75e 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -618,6 +618,34 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 MUST apply the device context fields in the order these fields are
 received by the device.
 
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
@@ -652,3 +680,11 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 VIRTIO_ADMIN_CMD_DEV_CTX_WRITE commands, the driver MUST end 
 device context \field{struct virtio_dev_ctx} with last entry of
 \field{fields[]} with type VIRTIO_DEV_CTX_END_MARKER in the last command.
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

