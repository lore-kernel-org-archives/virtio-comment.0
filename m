Return-Path: <virtio-comment-return-6668-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC1BEB64D9
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 56B3633567
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 403EC986553
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2898798643D; Sun,  2 Jul 2023 23:44:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14C7898644B;
	Sun,  2 Jul 2023 23:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhdRvmImRM49pSMp7cDB5CxACecc14q3mdpBg8ab+1Q6op+jOuvkPXJJZn/SMKTEhrXHtL1f1J7CVSBg+8ly8UPT0rl3mBZWUfw4zheP3Tq5dZHXG0N64//Z0o3FTEeVmwz7n1NVfGnZ2vgV9ckjk5y1sDHVwgCFrBjvz1hs3eprKigMAF+wwnm1UjSocjQnmG+mm3sMXG2l4+uB0hhObA9Xs0DzuIDE1xfNlgP8lq6V7c7hSrw/I9urNyeo6P9SnKpZcafMPiX7KC0hRFgHQjScIPkbYu5uKkElZxf7RezKG3YB5l0K+fsFwLXN3OFE6XTujsTwO4xq43PVTW3kdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdXwbjI89VMfsRBeLg4BWv1qjhmBf/MIjsrYf8Dki2I=;
 b=V1D8xmUkoxcATe006nFQLVb1bZ7wnvXBt7nL4JqAVSMDgWBnncI1Pbw5nXtOMNUo7RXpNyrJX7jc7FAHyn7ve4zSaccgaOvkmKTPPRhjcZR5ygGKUP26CgV2zUeDRG+AydZVlNPudVI8GzskuXGBq5RXvExjOCX1NSgW1hkZIH1meAtDWr6yDIkkQbAwqHyDTINHMcLgZYA70Qk3jHIyOOO62NjEwvD/cyA1lTzB7jM8VUyQOLr35YmtPwTAoxsL8U0Z4EZIjzdy/gQ9E7Edc3BLoHy6uZWh/lddRD+ljhDjdT9pCluL8V8PDmpowFlNk5UvMqnPyHM6/bTL2FQ/ew==
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
Date: Mon, 3 Jul 2023 02:44:03 +0300
Message-ID: <20230702234410.47546-1-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT098:EE_|MW4PR12MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c0712f-6f7a-4012-b93f-08db7b5643d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lmWAQE9spNxf546UDEJRvR+NsO4wkJyjbESm66TOKqUN2fkBMPl3Nt/iYth89fUeyX5TGx9Llkq2Nvuvq9jhTe5KQAWRWyN3jfFOO4EY5I9LQG7/8yx2G2GdQK0CRJmleWvG77/dPjo8Ri/8mwxNYvNTWs9bQsk4PYPGGdM4XY/Z0crRZru2mPuBuvLyvFeHnzgAoW3zuz61Li4JE+9IYLJz3CahspgFxjtRx3u5bRZCaGtVZdG9qBTNYjuHoGW4KwD88l6zp+ngeV+AuxTh1M84szice6oEvIOfszUuEn4Cg4ptjEi1P1RwdYVFiOlH2BNFCQGcq8NiMVXShM272ueLOM0TJYzvoiFsTO4gFWpIz9A8cIuvokB4tMkd9n98u18uMjIVKmplou6H6meWJZ3ZM35DYCvbqytXrgP3CzZghIpfitfPQjCcccRdgKtFlNPF0+MtTzBu3yGk30riv42YBTtXOHs4Y60GMuZQtzqTXS+20ib3hHOTWgv1eQlYZzYPZxt7Z4a+LivKmjfT8GhfHCiNISeMB+L74rm2zNnS+Ir9Sb84MjbMGXxXcWGHLTla6AavAB7Dvwau6Rk1q5gXHnYglBNex3n2uId0J/SsKGfFuzNd9Dj6Z4LcaHqCIM966w9WpFfg5dOS3wuvhUmLcM4L4HLcNaKAnMlcj9AYCm5nd+Xe3iD4s4HSxiOfNyJoY9lCaDluYb2isn52r3AWjhdR7khpXcXsoiwEbc3JRELx9PODkJrK3RzS/OLe
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(26005)(107886003)(478600001)(1076003)(82740400003)(6666004)(86362001)(2616005)(186003)(16526019)(36860700001)(54906003)(7636003)(6916009)(70586007)(4326008)(83380400001)(356005)(336012)(426003)(70206006)(316002)(47076005)(5660300002)(8676002)(8936002)(40460700003)(41300700001)(2906002)(40480700001)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2023 23:44:23.7341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c0712f-6f7a-4012-b93f-08db7b5643d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7032
Subject: [virtio-comment] [PATCH REQUIREMENTS v2 0/7] virtio net new features requirements

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
v1->v2:
- major update of receive flow filter requirements updated based on last
  two design discussions in community and offline research
- examples added
- link to use case and design goal added
- control and operation side requirements split
- more verbose
v0->v1:
- addressed comments from Heng Li
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

 net-workstream/features-1.4.md | 308 +++++++++++++++++++++++++++++++++
 1 file changed, 308 insertions(+)
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

