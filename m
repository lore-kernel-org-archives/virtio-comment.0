Return-Path: <virtio-comment-return-7399-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D4FEDEC4D
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 13:55:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5059861270
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 13:55:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E73B986637
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 13:55:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 177E3986633; Wed, 13 Sep 2023 13:55:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 070B5986634
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 13:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1ieATcnLUGeCMGEGUGbisEP6vmPCHRUhuQOfENT61pJLXFma+x3o01UAbEwls0Z8+UTLv4I7ASFhKPfV12rROXruJhSplb1eOqn23CAC3OOXJpB9iwCezrxJp9vTnChlbd7cZCgB+bxwlfqtaoUGSR0fmfLjuOwNolAQnQHAcLOW00GmrLTRTpxVuikq6f9ccsO9gGtOv8eP5G4U6Jp3vh98Ym/c44StcguUG+qZFwlw8E4wrlXlbuLeu4K/EXGcyFHoLsLwgLkciQnA+Gg/OrjnG7Ck8uyKU4Yyrmc/xnvufOHa83W3tytqSXrR+bHrx3SAO4WWyjzDdLP8YGXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiVx0B8J/F/qKe497st1RzZxMwzf3JVGqyLbL/it8yw=;
 b=dULKU7mOI7rZJX49YN35BZmB86iX+Pu9RktWnG8zmkuP5+UkOMyFvQ7OuDASXAMNasQC/E9KPLU4CTNaBECcU/ZdPxsKEvJvA9p0NMFvo310eAbqzY8A6kOlGEiOGE3/VRxt7/hLxgpHu4wNq+JIRxnRgCdQnRQTqv/V23WCESV4Cd2HaC9bJro00OU0T7S+dtKE103KE6yFhnTsqe1q43N3jc/T2GSS8FjeQ1hH6+c+83dd8ADVrSYDj6zmR0wL+rba4g2d/rThQjXSF/yk5X4Wvht6WNkQQzwI/lvfZCF8OBMtqv9jQpSLz76hjxMqSFyBzaa8lgaDhQYErst41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <xuanzhuo@linux.alibaba.com>,
	<shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Wed, 13 Sep 2023 16:55:05 +0300
Message-ID: <20230913135507.560540-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|CY8PR12MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 97bfd756-22ce-472e-ac71-08dbb46119e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E18jkDdPUev/SGqKHeTBPLlDJXj9bbgZ8ollF7k6B+WztS25ZOOhD7ybvAaxbYM+i1clR/mhZ3489Bj51YTPVwinvfrzJbisiQg3hKmSvy/+xhyYUz0c7PKXEQyYb0csxK0Z2ULLEyrXu/g3l7dqhDcVYmS8biU3ohhwVXGQcNx5B9tr7kyJ1W9TUlZpn5U1RRSXLJqhapxiD88cQFiNCp2bi4IXjW/0wpo09Y3tak+6gDZmIbqQ0i0BFUdI67oG1+Ak0JgGBJyT0li/FKiwJ2Qq2KIFIq0AyUM09vbUjpJxKsQA47jN+cIznCxy86mNjqVXBhUOj71dPYHn4cBDG2TurG/Lb4rD1l5Oqcly0A+KCSE4p4Qc3G9HUD5uT4BxVlGKlLiFOlJtx29dHUhlSW4zaiARdLMwoCU42Lx3o6o3diuQXeZy9ML2l3a867v2n6uGx7830K66Pd8Gv0VA/SyxXXvqZRrfAIxKVJah9FBMSbdtwUKbbNc7jmazh+/qgzhJIyE6BuY3VDBACZty4DUxH5vURzFw5DTV2Q4vnotgsjhaZmns94mGzyd0DQjyp6BbdC5znyN/IWdCrKdwuEW3T5QuHSjaLdqdSAXEvCT/UtZIJ1/99S0xHFl0ac35bj6AORplQSHKlIQMHawOfg4OWvhcXIVAlTkPuWLvwLUKQDBpoBDV8dKTWJXn9Ysx+J7HxFZTwM8L8hVoAPT0yWOwJrlMAURJzqMv+U9mabo+fQSz4FdmsHQmirpn0d7Pd/dPHT14ShDgcBJFHhJGgA4lhs1ZK0ZOfT7DLifEZlw=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(1800799009)(451199024)(186009)(82310400011)(36840700001)(40470700004)(46966006)(316002)(40480700001)(36860700001)(70206006)(107886003)(70586007)(110136005)(54906003)(8676002)(8936002)(4326008)(426003)(336012)(966005)(5660300002)(41300700001)(1076003)(2616005)(26005)(16526019)(6666004)(478600001)(86362001)(36756003)(82740400003)(40460700003)(47076005)(2906002)(83380400001)(356005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:55:34.0829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bfd756-22ce-472e-ac71-08dbb46119e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7243
Subject: [virtio-comment] [PATCH v1 0/2] Support enabling virtqueue after DRIVER_OK

Summary:
========
This patch enables driver to create virtqueues after DRIVER_OK
status bit is set.

This patch take the inspiration from the thread [2] with credits to
Eugenio PÃrez.

Details:
========
Currently, a virtqueue must be enabled before driver has set the
DRIVER_OK status bit.

spec citation to section "Driver Requirements: Device Initialization"

"Perform device-specific setup, including discovery of virtqueues
for the device, optional per-bus setup, reading and possibly writing
the device’s virtio configuration space, and population of virtqueues."

This implies that a virtqueue must be enabled before reaching the
DRIVER_OK stage. There was no explicit mention about ability to
enable the virtqueue after DRIVER_OK stage.

In following usecases, creating a virtqueue after DRIVER_OK phase is
desired.

Use cases:
=========
1. Dynamically create aq when administrative commands to be used.
2. Dynamically create the net device tx/rxq when device is
   opened when deploying for a container.
   In a container, number of virtqueues to be used may be <= max queues.
3. Dynamically create flow filter queues of netdevice when
   ARFS or ethtool filters are enabled as listed in [1].
4. Dynamically create rtc functionality related read virtqueue only
   when net device when timestamping to be used.
5. When XDP program is set, one can create additional XDP specific
   queues without affecting existing queues.

Hence, This patch introduces an existing queue enable and disable
(aka reset) facility and a new feature bit to explicitly indicate such
support by the device.

With this feature, drivers can skip optional queues creation during
driver init time. For example, a Linux net device driver
can create/destroy the transmit and receive queues when net device's
ndo_open() and ndo_stop() callbacks are invoked respectively.

As side effect, it also enables driver to not consume MSI-X vectors for
the PCI device at driver load time and utilize(enable) individual vector
when needed. This further helps on some cpus at high scale where a
interrupt line may not be available from the platform.

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html
[2] https://lists.oasis-open.org/archives/virtio-comment/202306/msg00097.html

Patch summary:
==============
patch-1 fixes to add virtqueue reset conformance references
patch-2 adds VIRTIO_F_RING_DYNAMIC feature bit, requirements

Please review.

---
changelog:
v0->v1:
- fixed comments from Xuan
- removed blank lines
- fixed wrong requirement link to device in driver section

Parav Pandit (2):
  conformance: Add missing virtqueue reset conformance references
  content: Support enabling virtqueue after DRIVER_OK stage

 conformance.tex |  4 ++++
 content.tex     | 53 ++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 54 insertions(+), 3 deletions(-)

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

