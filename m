Return-Path: <virtio-comment-return-8319-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E884CC4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6738021691
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5B2EF986D37
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4F773986D0C; Fri, 10 Nov 2023 12:32:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 41C1A986D14
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMrEBsw+OrV1DF8KlAlpClBgcj/GtsSmi/pJwgdrSA2/xF3uPkbTYLUygZx9xqY/0fXYimk4HmsiDvuM3C7AHHYqegv62+wOgYLp4OWgPFf4UAt7u+tCidar7NUTEKG4GrXrHpCriCeG4iIm6QUuEpWD2FXIZ8KRYxxsBlkTcXpnxpe1ssbn3nZTTK+sMtHQgygt9RMg+4FV70Xaxe7EOLZJi4cCa+Dzdlzj0bY4KH0Dmdm6kYK3JGFofp+4JerIExN+rKWYh3AFkYdR4+pr5nL80OwAJuf3eiYCBwTZm53SBfMBbFfIkBPi5C8vzw/1UkA6bJdP1ZhzSkfwZ1BWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBfqWh4T30vIkIvHXqZuDJVBKyNQ15Io5N6HMPjwTwE=;
 b=chJ4Do+Ngpf4IhXcTI8PFsjVNlC3UCBb4IG4PWnNHLpu3mAgv++Hrwqyv6Rvqtto7o/8n5TYeiug6/FVG3MojxSZp3DQ6DF+ZM9R6KTPZpQdhALAucvXm59RTwA+PKHsPZYrvoUMc9G4P3ob41+1pA+SMy/21C9PucQTVDJk5pJAMj+hSSbBpFCNUsC5hTyR/jC5p+/hQzjiQjc9U5FFTk601I6dVlWcwCOb6eo7y5Cdlkz3GTeA/0S3238zgQQoW4n0KBnFRsjyeWNZlmSttTjuBXJdEGIUpoPqs+at3Qsq2tvfV8s9lyKSoxbKxRNPOI/hGmPZg/qpHHJ5ykc+rw==
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
Date: Fri, 10 Nov 2023 14:31:58 +0200
Message-ID: <20231110123200.2082779-7-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DM6PR12MB4108:EE_
X-MS-Office365-Filtering-Correlation-Id: 92870d17-0187-463a-9e83-08dbe1e926ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Fa5d/jmCShAhNQkBPqdmu7Fd83uuxP9hrk57jEeTOmX1WLnJhyIs4QBPQ2F9FNWr3AwQtQ9NA1mw0EFx3ZdEx61zt5luJd9dbq6BeY5+OGeIfdnce/89WKCsKDXf2tRqmVS+15HoxmlpFTc/KzoGw0HFlu4fQVwAUyO/D5/DSP6/JjNzF2VINsqjZvj4heCJ00ZZpG6xO7m39fyDUZN3mO5vYl1X6eW0NIiKSQHxAbOdVL3oNKKedEmjycGen63Fcs7KgsvyPQh0N41+Cv16696jB9B05py4ZL2WQEbE0klwgMpV/Ejuo/Ni6HGvnVBQCJxRRww7ASdoiJvggmhM+NUsslrl7hGiVJBwJBXIkizKtvFvOslv4vvFhSUx/GAnJPWBBh67UFntAeMPn1cwA89buPKcYAGkCVDf6fYGPaBHhaB/xFF0808zkbni/DbPRYAxLQ9CEVuis3Cve8r9D61MgVgMdi/gawQclQXj01vfQAsIGhtNY2BisBihSO7Nc9kdJafBtOzNCUvPDccHMa3U4BVxvdNOSyB/OVEynleSr1f/C4ITkYTxnFNHrqQOL7u87iQA2StwZ5pB7tzBWB2ZHcKl9uvr4LnVxx0m2IB4zrorJy09vTGKdsMIV1kmFOPWBlHxV9f/s8bR4cgIEw6b+JRE1odn5hUJrUwcHGijax5Yq0rvgdC5sp6nNh6FF26sVrvAuDMbENfxh5Ot4oUFHvelZI5Jo6WDy99NESHlKSImdFcchUSimFaommJU46C7ArvENyBF92JYSJ2vw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799009)(40470700004)(36840700001)(46966006)(82740400003)(40480700001)(2906002)(41300700001)(7636003)(356005)(5660300002)(86362001)(8936002)(8676002)(4326008)(36860700001)(316002)(70586007)(47076005)(54906003)(70206006)(110136005)(40460700003)(2616005)(1076003)(26005)(478600001)(83380400001)(966005)(36756003)(16526019)(336012)(426003)(6666004)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:32:49.7762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92870d17-0187-463a-9e83-08dbe1e926ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4108
Subject: [virtio-comment] [PATCH v4 6/8] admin: Add theory of operation for write recording commands

During a device migration flow (typically in a precopy phase of the
live migration), a device may write to the guest memory. Some
iommu/hypervisor may not be able to track these written pages.
These pages to be migrated from source to destination hypervisor.

A device which writes to these pages, provides the page address record
of the to the owner device. The owner device starts write
recording for the device and queries all the page addresses written by
the device.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Satananda Burla <sburla@marvell.com>
---
changelog:
v1->v2:
- addressed comments from Michael
- replaced iova with physical address
---
 admin-cmds-device-migration.tex | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index a429768..39bfd9e 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -95,6 +95,21 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 The owner driver can discard any partially read or written device context when
 any of the device migration flow should be aborted.
 
+During the device migration flow, a passthrough device may write data to the
+guest virtual machine's memory, a source hypervisor needs to keep track of these
+written memory to migrate such memory to destination hypervisor.
+Some systems may not be able to keep track of such memory write addresses at
+hypervisor level. In such a scenario, a device records and reports these
+written memory addresses to the owner device. The owner driver enables write
+recording for one or more physical address ranges per device during device
+migration flow. The owner driver periodically queries these written physical
+address records from the device. As the driver reads the written address records,
+the device clears those records from the device.
+Once the device reports zero or small number of written address records, the device
+mode is set to \field{Stop} or \field{Freeze}. Once the device is set to \field{Stop}
+or \field{Freeze} mode, and once all the IOVA records are read, the driver stops
+the write recording in the device.
+
 The owner driver uses following device migration group administration commands.
 
 \begin{enumerate}
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

