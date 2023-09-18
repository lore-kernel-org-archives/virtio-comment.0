Return-Path: <virtio-comment-return-7456-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E527ECD13D2
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 17:35:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 440902B021
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 17:35:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E740986674
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 17:35:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 23C5D98640D; Mon, 18 Sep 2023 17:35:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1516C98662A
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Sep 2023 17:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e212F9XtpNz8cQffumEHFA/LTUIu3ETW3j/speQiUjGlNUZ+5GtLJChZn5ZirgNKGCN/wgg9WYyneWXISMKXSAXiL5i4UNrwhTpi4RUIb81G64b+IS0knkOSICWjBBaMIw4oBZfJUvgHIa43nOyty4nUnWGw6gE3wQ/5zDiMhXu1GokA1X3MRAL/ccf/8CbkFcbYNIjepX0qZHs2LGDTYnZuYFnXppRiaxxsOOJIeuUHjk9YwKTPfxu7y0iXxyZFB/h94QJJQCO3e0CV2zT6G0cn8prjIcmMkWdFM7b5nvL1zyslXgrH1XyKsBlaLsh1QLOQI8ydEtU/hliwhLSxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSzESDru/wBFKt73UCnT15Zzm5RvQUNdUTd5SqG2aUE=;
 b=DwTrB/TdlRdl5zxJ9+EDJiu5BKenqj4AgD1ECrRhjoL4mkmUW5yYbFaIurwS7lRDsiUdHy01qRW0joNKh/2B7Up6raBYW4nQq0BWV7QdaTBcCnVNj6/86ZwmeAXmgiRg38gqjeH6mZ8EKJtlG4g7JD9LcDm3+g3S5q0aVQqJemJWU9ZK6JNaq9rXEP6tEHCdpvarHTTxeJ/VTCxOO7GAbVBdzXeudB1KSvG/Lp9jnJj7F27Qd1p/WUP23m+fSOi50Zn290uKlnDXnLzQZkhfs8D+reh5Eo0bxZPr/o7UKeHXxB8y+Ts3ynEN5gBjcJi/22VmluDVrXosndcNUPGOcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <xuanzhuo@linux.alibaba.com>,
	<shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Mon, 18 Sep 2023 20:35:17 +0300
Message-ID: <20230918173518.15900-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918173518.15900-1-parav@nvidia.com>
References: <20230918173518.15900-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|BN9PR12MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: b912a79a-5faa-4a51-6ec4-08dbb86db5fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tDbgB533ZeNQegybzk29mI3hKYbLxluSkAXYoO8vDGBOIvA93j3bXQmaUqMhv2oxSbu5bWXTXdNQ6aoGwWgfZJiYv1vy/4tyAZhHE7Pk2Yke2y7uRKeM69BJmW8J8Jc2sHCe2GY+up32eIyhZPUP1J0vEtlk0Fv+s3TELOyMPntLF1IVRYgoL6Lwc4zlq/Hqlinhv8sMeH3BhRUYryG7OCA4ZOxUcnyYYw8S49fKhBCWgAiJ9ojH13jjaNVWxnfV/X+CGGGsGSSynPnz+GZ7RRzqVFtmBBlHBvbD5m2EnEX0silBpSsnQUrbn8wjR1CWwpqpoT9gDp/oiE3aFCjBP64q62fi/wjrajj6uOFCla3i6CJrhXlVY6EpNle+U4IJ9eXD2SLpAlsG6YCUvO6bX+K2EkeTbIx7jx19M7w/Ck/JCeW3ixK5JSdT2PIek0DPwXkZhz71dPz4VRwQ3yySSQJbfXz6ZxEXuTU0hirXHOmzHcq957c4oziA3BQYNpEYfLtpA81F4CVJkChjrhBayAjkwso5v2XcHxtDiYbRml1N4vVZUknbPA9WQHTKekrSW6v21miqauLEMy+YTpKGi9vjO+B3YnnES/tjG/neyV8iLthxtsIKryRZmudEMqRZh0q7Qx02HgE8ZMA88UkL9G5T8a38TDbeg2j3r9G6CC4V80ykat1PHWICI/96tv1J3AyIcO1KIUfgYMz8HmY+8Nd3dKG+v4vKms93W7JnLS/m4dC1CDyTBgYc0CjcWiNb
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(186009)(451199024)(82310400011)(1800799009)(36840700001)(40470700004)(46966006)(36756003)(40480700001)(54906003)(40460700003)(336012)(1076003)(426003)(16526019)(26005)(107886003)(2616005)(2906002)(5660300002)(86362001)(82740400003)(4326008)(8676002)(8936002)(41300700001)(47076005)(316002)(7636003)(356005)(70586007)(36860700001)(70206006)(6666004)(478600001)(83380400001)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 17:35:54.5216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b912a79a-5faa-4a51-6ec4-08dbb86db5fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5164
Subject: [virtio-comment] [PATCH v2 1/2] conformance: Add missing virtqueue reset conformance references

Add the missing references to the virtqueue reset related conformance
requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 conformance.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conformance.tex b/conformance.tex
index dc00e84..863f9c5 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -76,6 +76,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Reset}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Configuration Space}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
@@ -162,6 +163,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Configuration Space}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
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

