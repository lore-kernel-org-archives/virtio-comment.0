Return-Path: <virtio-comment-return-8017-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE11C4332F
	for <virtio-comment@archiver.kernel.org>; Sun, 29 Oct 2023 14:05:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BF9552AFD4
	for <virtio-comment@archiver.kernel.org>; Sun, 29 Oct 2023 14:05:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 84034986688
	for <virtio-comment@archiver.kernel.org>; Sun, 29 Oct 2023 14:05:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6AE70986662; Sun, 29 Oct 2023 14:05:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD65A98667C
	for <virtio-comment@lists.oasis-open.org>; Sun, 29 Oct 2023 14:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvpYFyJ1DWyrK+oZ0joMywcB8g2MfKuH3aSfpLcj6401wl/QjfQTMkY4NSgsNZO6eIRznabLaZ4tEA/Qh2sNPbsKB1sgi3gkq2YKVjEW9xydLPikmGO+m4IVWwPj1mIllrlAc+3WJOKQFQh7DUJTnD7mzX2LrI5TqXFXQNtx/l5ynR1Cj/Sbh1hQuEVQFMXqSKvoNyzJDff2cTGlJMUF4KqeRUpBdzjL+nx+dGhu+Y6Rpreqg18RV1u1FPLi1GOKpAKn3yWOeSxdd7jEqHBfKBt0VrQ2qaU03I2yV1OJX6j6Ur4q/oDPw6N0WtTsvp5l84FFSNYfT0Hc3Uw/dSo4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2mXn/LKhgm2kpceWWzFgvzO7xCMTnH4Szp30BcHA74=;
 b=QCQ6qphmIHO1mqRf7kLiXSRc+QQwi5xrNifjyUFoFg5EkjwOogQ9pENrplBcamig2g/DcQt/rWSNfQaK9Jr/BiKe8NyEeSqKSF7PAagFSZntkf21kPqE5UOqoTPHuc/wyAsq3UfoAiDLWR2bBjIPH1VfwJQ9dtVmMH1yzRsjo2lBLLHNsiBOjnG94jkpX1gOo/KrCn9dtm37fJB8R1TDD4TkJ9E2M8aXgy05ZEfVyBdT7THzfIZQhJ/p8piQuT+6+oyctMzx2v6gW3pVDGB34SmQb6J39px3x/OjvqZz+jr6v4vEez19b08ElkoexSgJ+cKiQIm89qT0BoCLTJIsFQ==
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
Date: Sun, 29 Oct 2023 16:04:37 +0200
Message-ID: <20231029140437.1379386-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|SN7PR12MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 6280fa43-efd0-4b00-2945-08dbd88808b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jB6nEW31C2GMjOaLNIY625kUKkQwxoF30e7sIFFg2eYCY6hZDTckMVjWGcejVCSVFytAUKoYcGmC2ga7mi1NCxNxlGRYctS/nfnSHLImpz8Xzhhi7T/Yc+roVP4dGOgS98ZsCyPH1KJVYYO2G2QdWGr3ogqXPQFCWEjW0VrIN98gIiT54RRvZPNYD+hh7UMNfx3n5mHc/tMRfALtF7hRyky080h52HclJTb1N7cAKhENEcxHeAx6rKZ81aBznh/XSxLVUdBDccdq37FTXHqlIAGbdIAd+7LYBaMpyLk3ZX4ocJWm+XfvcAeWHq1PhWf+RdLXhPpJ0hvSnFIL6FDoHYHXXpjWXWk5fI+2IYy+gax+3oSnTxVO9mnh++stQ9umLg2SlmeK2WfTn974ulFw0kTXIRRr5n/SbaeOzoiSkgj5Pje21cDnKw3diM8JYK/J1zJWjluNxLV0xtgUK1XEOt0o+5IwFJr00uMP8ayB1NYLQLh4k69XgIHOoapfo9qzJPtJQqGcisPB4b9mKEPGZTvs4TqZBHslsMMthvlhH/i7EYGnRl0RS/dtR7+psV4bNwgVjdtadhzUauFS0a7/FbAbixAjrhoAAOyG9S/rLYZ6RtdBw8A9ortlq576G2d7ULMbT+h5JYpqyNEF07Xx19xA62cSiLm7wMJWeX2/SkPEjhy3MjmpfgDKIJaFVL+/djGBMrjoVnnF2bclWpHj326bwBU8yycIjv5BdKI5RJc2uek7eJaO7jX1VmhreYmk
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(82310400011)(1800799009)(451199024)(186009)(64100799003)(36840700001)(40470700004)(46966006)(1076003)(26005)(2616005)(16526019)(107886003)(336012)(478600001)(6666004)(47076005)(36860700001)(83380400001)(426003)(5660300002)(4744005)(2906002)(41300700001)(110136005)(70586007)(70206006)(4326008)(8676002)(8936002)(54906003)(316002)(40460700003)(356005)(7636003)(82740400003)(36756003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2023 14:04:57.4696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6280fa43-efd0-4b00-2945-08dbd88808b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6888
Subject: [virtio-comment] [PATCH] packed-ring: Change host,guest to device,driver

Rest of the packed ring description already uses the device
and driver terminology. Change the introductory line as well from
host and guest to device and driver respectively.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 packed-ring.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/packed-ring.tex b/packed-ring.tex
index 9eeb382..2bb66de 100644
--- a/packed-ring.tex
+++ b/packed-ring.tex
@@ -2,7 +2,7 @@ \section{Packed Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Pack
 
 Packed virtqueues is an alternative compact virtqueue layout using
 read-write memory, that is memory that is both read and written
-by both host and guest.
+by both the device and the driver.
 
 Use of packed virtqueues is negotiated by the VIRTIO_F_RING_PACKED
 feature bit.
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

