Return-Path: <virtio-comment-return-8018-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BABC4332F
	for <virtio-comment@archiver.kernel.org>; Sun, 29 Oct 2023 14:16:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 780112B019
	for <virtio-comment@archiver.kernel.org>; Sun, 29 Oct 2023 14:16:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5917F986689
	for <virtio-comment@archiver.kernel.org>; Sun, 29 Oct 2023 14:16:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4365A986662; Sun, 29 Oct 2023 14:16:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3290098667C
	for <virtio-comment@lists.oasis-open.org>; Sun, 29 Oct 2023 14:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+D3IZtWfcF2T3xY3GT1d4027VW4QdqbvxbeCCBtchlUR0ljb8OG2Y+Hd1EvHAo2v5FnHuczF55iZevgjfpG/QIXRy/PByX2ZSDTjjWDCzWV+jleMapuLK/9qAfbHjuobI3KSZtjccS7hzan0hmjVHg4fJ99MpnmmUtlBFzmyJZwL+pnMkXeQRHpDG1H4WLqsA/dz3e3lH2dxATOJ4/luhjk9NukLXxH5PPJNoY8cuY1QodYeHP555iRyA4xavYPTrzuUD8zHvUjA17J3bUwF7SgKswI1NtCbZXPvzKAIquZJDU0EdwHPkCaMxPxhKcn9tImyXxYMMk25f+JFqWc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ly3kjqmsYQPWEcH/Q4aQmjsHQ4jWoCjrMTOaBhTVnoc=;
 b=loNNz5TJ2p4kKXWo0+35Dt1J3bd6ghN0AvrsvBPNANahVXUBkZLOAQMR1CdVRAo6dMKytuaf/QYQEBQisQjNevjnzPAl503fXoSZ/tvtt4vzb4l7oXx+zEKPrzcDpSXqsDJSItLEy6E/RYYhNBccc9SalpJa5dUuqSHJALjUuGc/73xD3iTNEWtkDIl+2voYblcxYcRC2C2rMBbEFCMxrEFtTijmn2GJHSBKDoh1711VZhkf29SOv4OjOatha5/HbUBluq6ImYVt3jdr7EA4AWYhcrab2idD5ggnIF1yiRJOWF/Wf0E6YxXWNIPELuVBvpnLz4Y+LJmN7NCfCZqv/g==
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
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Sun, 29 Oct 2023 16:16:15 +0200
Message-ID: <20231029141615.1379537-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|SN7PR12MB6815:EE_
X-MS-Office365-Filtering-Correlation-Id: 3edc84c5-2977-44ed-7d4b-08dbd889a5f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wC/Dbat8B07f9oh14tbMnfQakgBdHVK21ZLNzQXu6/zxaKX06GbNaYaz11oq42YxXCtpGTfMU2OALQHusermsH00SVoKv6D1g6bCuiSoclWiii6SOTJ3FeA99EtXAH/zk/jSEZjXA5cvjwYXF7uGSQJJaZp0hz2UT85+v+yHaVBlVmTvpJwQv9GrkeaT8coZEj/nf4Wmc+F7ROVVCNRx8ekWNkhYZVcHyouTITk01bbqceTGOHHRSVV8lkbjACOPoz+oIlYIh0syA1vI8i8dtOuG+Y3Ca7bFUml5XPQktqiuDzbyA8WCTzc2Ayta+VUT/sBcBwnxg8UbMkRcGkNWSTImgk7gJ1/3skwiwvw0/4c2K95UrB9ji2g3fXelzmMa6JO1XTGywzfnnk6BUmWP+7wr0bRVZ1F1Cc+KJZbuZARjp0ttfeSHD0ve/YufXj0cGqyGFxqVNPHtQwqOx+LvE9Ad0dGLO7LgMMD2FjeZEsyymKRhxFjtqB5tR7ETbORvY2Uhjezoll+w3e/QwQG9zZmxkDBanqteJNQDWQtPLouFyQBXd58d7WSSR08jUamFTXMF1RjkXe2F3nnwWbeVp8RLynz2mqLrDew6O5Yf3bgZMo1skfNkbxzd3D4VC4tHierXee8YBG/QhgUiIlav0QSwScvb/wIk83p+v0Q8MnA0Jur2XKNO/vSc8vXG1glfqU5E7BQPYTRjdMROYvWh26JNhOMO3pPv1tNoiQUumdde+zrohHJes4Kk40SQTnyN
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(478600001)(40480700001)(40460700003)(86362001)(6666004)(4326008)(41300700001)(8676002)(8936002)(5660300002)(70586007)(70206006)(316002)(110136005)(54906003)(83380400001)(82740400003)(36860700001)(47076005)(107886003)(336012)(426003)(36756003)(356005)(7636003)(26005)(1076003)(16526019)(2616005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2023 14:16:30.8073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edc84c5-2977-44ed-7d4b-08dbd889a5f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6815
Subject: [virtio-comment] [PATCH] description: Avoid splitting the wort virtqueue

Don't split the word virtqueue.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/gpu/description.tex | 2 +-
 packed-ring.tex                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index 4435248..66e4873 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -190,7 +190,7 @@ \subsubsection{Device Operation: Configure mouse cursor}
 
 \subsubsection{Device Operation: Request header}\label{sec:Device Types / GPU Device / Device Operation / Device Operation: Request header}
 
-All requests and responses on the virt queues have a fixed header
+All requests and responses on the virtqueues have a fixed header
 using the following layout structure and definitions:
 
 \begin{lstlisting}
diff --git a/packed-ring.tex b/packed-ring.tex
index 2bb66de..3ee55a1 100644
--- a/packed-ring.tex
+++ b/packed-ring.tex
@@ -194,7 +194,7 @@ \subsection{Scatter-Gather Support}
 
 The device limits the number of descriptors in a list through a
 transport-specific and/or device-specific value. If not limited,
-the maximum number of descriptors in a list is the virt queue
+the maximum number of descriptors in a list is the virtqueue
 size.
 
 \subsection{Next Flag: Descriptor Chaining}
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

