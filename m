Return-Path: <virtio-comment-return-6342-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDE5EB64D8
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7A71116DCC7
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F04198669B
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 48F22986656; Wed, 14 Jun 2023 04:23:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3548C98665C;
	Wed, 14 Jun 2023 04:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeAXvPAigWW0N1oqhucl4jkIXwUOHNGLNzJYft3hYCNKb8OwFeCrgZ8L4t0lSYZ1/1acxiNDbc7MUC+vTeEeSapuQncyIPkcFIBXOS2YM/39K71YXe1Vl70JyP/n4p/7Ht8ZrR6gx4xRFBgpK6AjFZT2JT3gcoIWgzygO7jhbwGTbv6jypRs1wKjdC6GUyAnLQQaQXTJtiesiz3Qt+wywNVbYLdsgI2WfRkaWY6i8G3ioXfk53Qg8x27/JhwsurD+iAbXNmBYGGEqOWpg1FX1mF2HA6kk5i5o5Uwh5vFoITGSZRJsPIorQJXFIGpd75xb7fbFu+0MKYgjizpYOvbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojrnqThpIA0DzWcBcRcCiCrikCjcxgYqhXXqBLNiPhA=;
 b=ABjHw2ewLRpxv4OFxvBumtxgJ/CfMUo6+36NRywP+/PjQBOlygrCvZwj+E8nFkOdOLT5uJq0becoPzvHl0yzXKvkCxRRIqlVguQY+0cQmFXdZfMQDfG2lFvEIwfOtglSGOAvWuTPb1okuryiAgHGKtzTFK1EqDrx+FI+1MltG2ofLBzt2E8sT9KLrls//tkIODL3YhcXaawaiFUcE3Pxgay7MHJFnjwcnv1osRefDZBDmjGf1f7/msqMzokvfFQ/iCe3lEruz6TU9wieBgdfpkiKq851wGoN9MgJ4Du/Ei+9dROM459iWLaQrtj3fzZc0NP700uGh6m0oJVWU/XogQ==
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
To: <virtio-comment@lists.oasis-open.org>
CC: <shahafs@nvidia.com>, <hengqi@linux.alibaba.com>,
	<virtio@lists.oasis-open.org>, Parav Pandit <parav@nvidia.com>
Date: Wed, 14 Jun 2023 07:22:50 +0300
Message-ID: <20230614042257.1252775-1-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT052:EE_|BN9PR12MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae26f09-7853-461e-295c-08db6c8f174a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	noGQR507vyySSNPAcgImJD6/vy8AtHTakKME6SJ/yhmapDddrOmdcvBsB3RggowZWHw2CrfIXt0CZBRkGCJ5TJxqZxWsL1rO9a3s0v0ZDrJ+ygHmr8jG2cX+0jeffJQBFLexw/mfF4OG4vfNbWmOfDb9jxvuCgBdoGhCj2seoiTZYn628vfn6f0+zJ7HJmP7Q9/QgAmGFlw0MPxieeu6vmihZWUXTIvXHw5wDZQFy2Zghx1b/I3PjCNolZSA81Bj7roVcksHEBCi7izpX3e/SyKuHnuq/z1+GYSb08+Td06sBA7GdaOSoa0GSBc+T9snBPnS6XD5syt2Be2snojmSXu/Egy+BOtcOfaGPC+/Cp/EFoQ3Vjk7BMRgYUFvl/Gl80BNSeEOP2dy+FuQFClSS99aGPi+z5cbVOUM80/KgCe84VEPfb7qKmKm/NoP9ggQLyTTFlxLNQNj/pzTD2bC1hRH//P0s/fX3G9x3pRWBFrCRvHQDSygMdKQGAr5KKSKqVrT3zNpvxFF3oGt9uxr4vIUz59QyvW991ioltvPmnev+NuFyYcm6N2eHKjvIfapx62U7oc44FmnutsDpwzNj5f5/N831rymr1TXzmih9cSLMuOcjs6nRZwKVjNvK5AUD2Sz2+L9QqJaW2fRyak3qBm9i/vbbmKiCbcSBlmMgIdZT0U9dXAtGEGi8fI93aeY9sLVCGaM1i9wtAvYKhM02AmXMZD7Sf6KmjpaTnMkjUdPWmFKqgAv7KhmNJZbxDUS
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(2906002)(8676002)(4326008)(70206006)(70586007)(8936002)(54906003)(6666004)(6916009)(107886003)(1076003)(26005)(316002)(186003)(41300700001)(16526019)(36860700001)(82740400003)(7636003)(356005)(336012)(426003)(47076005)(83380400001)(2616005)(40460700003)(478600001)(40480700001)(86362001)(36756003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 04:23:22.8041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae26f09-7853-461e-295c-08db6c8f174a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5052
Subject: [virtio-comment] [PATCH REQUIREMENTS v1 0/7] virtio net new features requirements

Hi All,

This document captures the virtio net device requirements for the upcoming
release 1.4 that some of us are currently working on.

This is live document to be updated in coming time and work towards it for
its design which can result in a draft specification.

The objectives are:
1. to consider these requirements in introducing new features
listed in the document and otherwise and work towards the interface 
design followed by drafting the specification changes.

2. Define practical list of requirements that can be achieved in 1.4
timeframe incrementally and also have the ability to implement them.

Please review.

TODO:
1. Some more refinement needed for rx low latency and header data split
   requirements.

---
changelog:
v0->v1:
- addressed comments from Heng Qi
- addressed few (not all) comments from Michael
- per patch changelog 

Parav Pandit (7):
  net-features: Add requirements document for release 1.4
  net-features: Add low latency transmit queue requirements
  net-features: Add low latency receive queue requirements
  net-features: Add notification coalescing requirements
  net-features: Add n-tuple receive flow filters requirements
  net-features: Add packet timestamp requirements
  net-features: Add header data split requirements

 net-workstream/features-1.4.md | 243 +++++++++++++++++++++++++++++++++
 1 file changed, 243 insertions(+)
 create mode 100644 net-workstream/features-1.4.md

-- 
2.26.2


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

