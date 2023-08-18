Return-Path: <virtio-comment-return-7194-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C019C71133
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ABDB02A8E2
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B28698649F
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 70D76986337; Fri, 18 Aug 2023 04:36:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5718B986447;
	Fri, 18 Aug 2023 04:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ac1K+DT8LUToQIgCv0WiDk8bhKEiQQxiQ2Fwik+EbZvxINnS7KjVVJV79MsMITZiPoF8h0fsrJTfVtCUHTOhOiQIs/tYkIxDjZdZ99r13b7ZR3sMj1wYjVqJMdFBl7oRAdAziCDfX0m9okLC5xCQo0CTvt0J6pRxICm3HaS45dGJfm1bXkeVkj3S9tmvsZSPh9Zc9LpVTkl+SscGRpBWV+wJmsZmt0AwU1SxvCm2nc7GT6eys0X2EGvDs2JM444KP20MSEZS1tK1IRV/566NDYsnQE/arxVAiirRXwZVVXRxIWBk/QK9CggU1nkpWhbz5EY4A/0Bd6qaMbvi+mTc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fbWFVhmJmG9zfpN4uIzcZuihbIqBkmmtA1r/ocP0Ro=;
 b=MJNelw+sko3AfyjFNjsEvFcpL40ZcapqWJsI5koHwunfhHfZGT32Y1m21mhggnbp3zR7+3PPlDBybmElDJ/3878OAxXX5FrvSCxNB42SSXpVP40t6RKuUQdPif3xX2UeEyGcn5epiCETX+d99UpAP7J//gtIi7FIqbU75g6K2CUqZTDBROOHlA0PUib0oFY9dkvndIC2d+LWa6ikvs0oNmnhA11J/oubbgCaiiyTS9h51qHPdX09LLsSxqEx7Qi58/cHa2XH0TFucGZUIKuFLpDKUi3AdFt0VJHoW4anwugEIfbqQ+ZdNwPjZJzov3nPsVaJHDHqYJdhtCdjX7KsSw==
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
To: <virtio-comment@lists.oasis-open.org>, <hengqi@linux.alibaba.com>,
	<david.edmondson@oracle.com>, <xuanzhuo@linux.alibaba.com>,
	<sburla@marvell.com>
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Fri, 18 Aug 2023 07:35:50 +0300
Message-ID: <20230818043557.496964-1-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: 81bed18f-0b8d-4a46-3c6d-08db9fa4abd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	js1E/CkbvPDtxfBBzhvXaLE8N40NG/WfsTMykIFnNbvH1EJyj/hYGQclK8RG4oBzbE1AssU7ytng8P3asoaJZ0vJuBn/o6q2irfz+uyOLcTVOdL5RHRNLcXJmoEAavowW+b4aGOkWhhc2cgjavszYiiC/8lITV6XIUFPLlkb/ykkT3GojF0COMxgVubpWOXx5wi3ZSTK0tUSmrEer/FO6gnp5DT5LD7VjV7Lm9uX7wuz3i4Ye8EQkMTQgi/WGiXKoNO6BQ++7oP70u5th/rDxLgOE3mMDWykiD9bxKnw17LWQCH2UUbXaxVu5lGxqZnu2UKFQp9U6vF9tkekBSCFGnXqUGQL/jS7QVA4X1AuwoAXJeAOkZYF+lkh9Mk6SqfsAUPmZYe/HFMmgNO43NwTckSuO7k5gotg6gLGpJQtN9BS1/yd/05sSTwXuU54vUMqX0MZBQYQd/m2Z6bELz3yBn9UyiGq+j9h4kMHY1T4TthaZ0KtzWKjYTVKLznP6IFBirsPjAkxS/7lZo2DSettb7zrrvYfREWfdUlwvdtAg2KJG5zRv0RF6JngrHUNplR6bMB+w0UxQ7RC/rDj1OCTF0bXf9O2UNzxxKlq2KDUetSRuGcVrwtA3gpQjBSt2WbsHA2wCDsrNZwIyoyX8iTxKNHNR4Hx88RHzcUyI7057CWKJS0HvdzF9//VSTaWoeCqa/dopNDO03fRh9eUUWtzGe46JYhs59GTWmlCSrADmLKKlHDJijiVhDL9T9YyIoYV
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(82310400011)(186009)(40470700004)(36840700001)(46966006)(86362001)(36756003)(82740400003)(356005)(7636003)(40480700001)(107886003)(2616005)(5660300002)(110136005)(16526019)(70586007)(478600001)(70206006)(6666004)(54906003)(316002)(26005)(1076003)(4326008)(8676002)(8936002)(41300700001)(40460700003)(47076005)(336012)(36860700001)(83380400001)(426003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 04:36:20.8360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bed18f-0b8d-4a46-3c6d-08db9fa4abd6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400
Subject: [virtio-comment] [PATCH requirements v5 0/7] virtio net requirements for 1.4

Hi All,

This document captures the virtio net device requirements for the upcoming
release 1.4 that some of us are currently working on.

This is live document to be updated in coming time and work towards it
for its design which can result in a draft specification.

The objectives are:
1. to consider these requirements in introducing new features listed in the
document and work towards the interface design followed by drafting the
specification changes.

2. Define list of requirements that can be practical to achieve in 1.4
timeframe incrementally and also have the ability to implement them.

Please review mainly patch 5 at the priority.

Receive flow filters is the first item apart from counters to complete in this iteration to start drafting the design spec.
Rest of the requirements are largly untouched other than Stefan's comment.

TODO:
1. Some more refinement needed for rx low latency and header data split
   requirements.

changelog:
v4->v5:
- Refined receive flow filter requirements to be ready for spec draft
- updated timestamp requirement to feedback from Willem
- Fixed counters rquirements on comments from David
v3->v4:
- receive flow filters requirements undergo major updates to take to
  spec draft level.
- Addressed comments from Xuan, Heng, David, Satananda.
- Refined wordings in rest of the requirements
v2->v3:
- addressed comments from Stefan for tx low latency and notification
- redrafted the requirements to use rearm term and avoid queue enable
  confusion for notification
- addressed all comments and refined receive flow filters requirements to
  take to design level
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

 net-workstream/features-1.4.md | 383 +++++++++++++++++++++++++++++++++
 1 file changed, 383 insertions(+)
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

