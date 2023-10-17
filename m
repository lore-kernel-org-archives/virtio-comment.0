Return-Path: <virtio-comment-return-7756-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF65CDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 14:32:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BC7A21FF67
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 14:32:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F61E986870
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 14:32:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 71EFB986862; Tue, 17 Oct 2023 14:32:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6219D986863
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 14:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9nb7hHG9C0PXOmeBJy47GWR7mUW6MH2eXs2FP22rJN9wGfB1RXmcmkrNJ+uGw9rwW+MnwuoUuHk/k2C94Ca1ouxvR/iNI1e6A6I5XOwF09MxBmpnthxY4a4Qp/Mu9YrrzzIbCPX3SH3tqPH3JTKnzDy7+5rdTWcxV26I29RNFZwQA0nSLOqwtE0kE2jz+0N9d4UakGp+dU81Irey+BRHJzc5ewZjSabyRqLyjLBXUouaCZdK8Q+OFzm6zCVNQnfwMk8iqpbc5A4cURR+pTemcW5TU/ELNktvyrzB9Ml9AXromE+NOld6xMUz6MJL5/P+/BTXGdeD0yeEilV65sP7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfiHx3/1DuTY9eURt7FGf/1FNFnaEiYGuUzh2z/9is4=;
 b=fahuWBPimCq2AyU8E0QKm4/cmI6aT6AVYnOwIrs62ilv8K8oLgcjvEH6OqzkedQBkUvtm676R7a5LovzvB7qMB/fX1ZOdcP3Ay0zYw/ErkbPdvAvflyTzRCy/sx0t4S/xBcLGNz93MUWAbbYt1S0m7I5R8EMSIJZWLk404SlvlxHqbXQgLSI/BbicLNuaM0FCcS5Qnt7cyVRasu+V/l86h+iKO8LLWQC0BovBjPY+fkDZZs6ccexVlseGMm8GMtXSIjUXjS23kCRtP5ATy2/+3a5YWNbm9slgW6LhT94kplNTtq3cLG3b4lXTVRrW/y44IMuE8/5Yw1Z9J8S8ZobOQ==
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
Date: Tue, 17 Oct 2023 17:31:33 +0300
Message-ID: <20231017143135.758523-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9c7e99-1a26-4c85-1863-08dbcf1dd501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B4G7WSsLNUtCVeawv6FtgqZMEwiEpkwplmgktsdfvNclPvKPzjnfHIRZZm5iU/mnPpUF4igwvoCGNs197m9xatdbBKauCxHAp4IEFb9OUrNFb4Gs8jgH3a9a/sBSMGN/NPTjXJi96uehJRQnJf5VNhpKdmOFAnFl+iavYUBjpEXwDFFcs7bk9QFbmr5GTGt0lKQZReQXLi1/mPPW/Ko77eJS5VpDG+ic4L4o3gYH2GMGHAZYAQx54hDJ+LTEJ8JeyxIqfc0AkaPOgO6ztbI3ltCunvllvkmjSRXnMjHiVjmnPQthsNBq3b6PZfb9BtHZEgR/0eEUD2P3njiOvRNCYL92QgBy0yz2Rbf23hQGnGrs88FASK/72vyNNBYBfsAi/T6mi0wsGN28IbK5dYd6Eq8/NZIstbTM45iwAKfPpGkoLqcXxW5LJBY+AAR/7jou4kWo9gEUjlCPcdrrq9THsRBOjb01tZqX/O6Muvq3DiqXoY0PaouLyiwxOqvf3gtzzRMVNs0wDYcCXLj57DdquSiMt9NBY+6cqW4JKwqyd+MMzGY0nnE5HaquYAIKKO6lpI0l+pynLgIjb4e1AjX9mpEDZpWWrXgxxrj5/pqg5hkKHtoOEXdXga6gx6W2QokusBDz3dZyMLRixHbT9DFSQpyypMcaWR3UbfVJWiWbxaLWRrIHvovrq+7VVvioetPYmgLHdPUuh0xMz2MW++5PpWQHIQqgrHxW9hAE3Xfeu/vVrXr3VCnVhtaegR6Lo26uAjdW8MPK4535bxH10Ahd1vDCqnVKSExwUyo3vEzAlxE=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(316002)(966005)(40460700003)(70586007)(70206006)(54906003)(110136005)(16526019)(2616005)(1076003)(426003)(336012)(26005)(47076005)(107886003)(83380400001)(40480700001)(82740400003)(7636003)(356005)(86362001)(36860700001)(36756003)(478600001)(6666004)(2906002)(41300700001)(5660300002)(4326008)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 14:32:03.6114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9c7e99-1a26-4c85-1863-08dbcf1dd501
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920
Subject: [virtio-comment] [PATCH v4 0/2] Support enabling virtqueue after DRIVER_OK

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
ate the net device tx/rxq when device is
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

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html
[2] https://lists.oasis-open.org/archives/virtio-comment/202306/msg00097.html

Patch summary:
==============
patch-1 fixes to add virtqueue reset conformance references
patch-2 adds VIRTIO_F_RING_DYNAMIC feature bit, requirements

Please review.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/177

---
changelog:
v3->v4:
- addressed comments from Cornelia
- reworded description for _DYNAMIC negotiated case
- replaced article the to a
- reworded driver normative for _DYNAMIC negotiated case
- replaced 'required' with 'desired'
- extended description for skip entirely to skip or do partial init
- removed article the on plural virtqueues
v2->v3:
- github issue link updated
v1->v2:
- fixed comments from Michael
- reduced device and driver normatives (simplified)
- replace 'a virtqueue' to 'the virtqueues'
- reworded to remove 'interested'
- avoided repeated 'device initialization text', replaced with
  DRIVER_OK status bit language
- avoided confusing text around 'MAY' in the requirements
- replaced 'the queue' to 'specific virtqueues'
- replaced queue to virtqueue
- simplified commit log to talk about msix
v0->v1:
- fixed comments from Xuan
- removed blank lines
- fixed wrong requirement link to device in driver section


Parav Pandit (2):
  conformance: Add missing virtqueue reset conformance references
  content: Support enabling virtqueue after DRIVER_OK stage

 conformance.tex |  4 ++++
 content.tex     | 44 +++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 3 deletions(-)

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

