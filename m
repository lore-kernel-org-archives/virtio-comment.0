Return-Path: <virtio-comment-return-9101-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0FEC4829B
	for <virtio-comment@archiver.kernel.org>; Sun, 11 Feb 2024 09:48:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C983F2AF8E
	for <virtio-comment@archiver.kernel.org>; Sun, 11 Feb 2024 09:48:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A70AC9862DD
	for <virtio-comment@archiver.kernel.org>; Sun, 11 Feb 2024 09:48:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8497A98401E; Sun, 11 Feb 2024 09:48:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 70D2F984279
	for <virtio-comment@lists.oasis-open.org>; Sun, 11 Feb 2024 09:48:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekOMj20TvC5ik7AOSu3UomXGFL0qadZ/MTuvXCP7ce37qTlwvXodVFY5GdKDY1Z2A8E4GtuAr7gwIeiFk5SrXRvd3zQROetNDPENkemK4udegHigdP/4V1eBWnEmZgWZCRxc5d1t4XMfTo8fx/7APLPKfjvUqwFbySvvZA0kzk+1xtNb1JkwnIXGxNU6sOiSHstqYkU3Ebp3tG7UTLQFKqcHiGbQUO0DXt5JvpPLYf0wDRRnZ3oiRhXbh6ThXsMpYOVmERE/G+JmP3ksKERoic8OYq9dqh65Dc5wkpwdwWMpoNHKdgugtIBhCWfi9eKqVBzgWvICj5p3s7I+tDNe8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKpHq8KKo5xvv5n1gN6F4Rkc3c614Fb2WOmozKBIQks=;
 b=jnDbSGoStEIJ/bnVWDcdhOjyFGhHlsdfYGJfP6NChHJjzDxB7DPg8A0nj1Sw4IX5nkmCIj/25o9obZBQkmV2BpUIcbCiIVQpZE5EZKMUnR2xRc+iwGJEd7Mb8kab1ZfZOIYR+HV6/ORjIdYvqVk3EyFzAF3oP8uGpKyFvZPWmTdQvTFWZOn9FtOqZCYSiAXkJeM2OZaIiAFCqDLV5j/nqHPp7EkxvlV5tQLT1rVWKiCt6Ph5Ss39Z2dalJuobPn79zWgAnlIvpQW/KBALFFe5Ad8wQkolnvwYczMsOi4IkvlcE7XLEv1uViU2BPU2eigzo6q61oSTg/RtIexbwubXQ==
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
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Date: Sun, 11 Feb 2024 11:47:58 +0200
Message-ID: <20240211094800.5397-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c324e60-2efc-407d-e793-08dc2ae69945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1pQCPY6HqANGtwFq4diM8kKPAHrhuP4UkKxqANCajWyO8GUe7Ah+Gfh+tH4DKDYiALQau71wNWwkkXhKFhL+RDyNnFtWpGyIuxFMSP6kF4GIDTy1RFCGhtcYyld7yjxTCYP5KTTng4dklC93PxMtaI7kanbdLy3/RT4+mkfTqUGek90nW6BR+YxpLk/V243fNL1eV5+07Sxts7iriNCrPjc7mn5L+3AEK47k2jyXn3g+jXQk41ne/xhUTAejMP+KHn2ZAmvITB6NgetP+2DnU4VK/gdA/42QNIqgGSlV3Js0tLhm4AUJQFW1fxLl2A6z9b6Xx/CMtMByh0Il3iC1muuz56Q0QwN48DI+vvXlgjdcLznbp3WM0W023ogVUSYuZUsgIulgWTx2hnQQRMAfpJ1wLvMiiofJbX23+8mhp3gqGjUSV2u6LUJaZgu/Hsl5FG7oGfoP3VUr7ddMIeA0AiyQvBuBIXRBTkif2vo9scJbNi/QBBiCDh9CxR+dOZhACkv3AVq+QNZpiFGre6stqS4BZFIdtZjizEB1TZDlomHMDwxduT+T8NJZno6TTCOAaWDXmwZVPDmaTgyn17pb6sMZ+bw1xixrriuKWbY8goI=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(46966006)(36840700001)(40470700004)(36756003)(16526019)(26005)(1076003)(336012)(426003)(2616005)(107886003)(41300700001)(83380400001)(8936002)(8676002)(4326008)(70586007)(70206006)(478600001)(6666004)(54906003)(316002)(110136005)(86362001)(356005)(7636003)(82740400003)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2024 09:48:28.0389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c324e60-2efc-407d-e793-08dc2ae69945
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399
Subject: [virtio-comment] [PATCH v4 0/2] virtio-net: Clarify virtio_net_hdr size and rx buffer size

There are few small issues around size of receive buffer and size of the
struct virtio_net_hdr as following.

1. VIRTIO_NET_F_HASH_REPORT is only applicable on the rx side processing.
   However it changes the size of the struct virtio_net_hdr for the tx side
   as well. This was not clarified when VIRTIO_NET_F_HASH_REPORT feature was
   introduced.

2. Receive buffer size calculation description and requirements did not
   reflect negotiation of VIRTIO_NET_F_HASH_REPORT.

3. Receive buffer size calculation was incorrect for ipv6 guest gso feature.

Above issue 2 was reported in [1].
Since issue 2 and 3 both touches the same set of requirements and description,
they are updated under a new issue along with tx side fix as well touching the
clarification needed for VIRTIO_NET_F_HASH_REPORT.

Hence above three issues are fixed under issue of [2].

Patch summary:
patch-1 fixes receive side description and requirement
patch-2 adds transmit side clarification for VIRTIO_NET_F_HASH_REPORT

changelog:
v3->v4:
- addressed comments from Cornelia
- rephrase for virtio_net_hdr size calculation
v2->v3:
- addressed comments from Cornelia and Xuan
- added virtio_net_hdr inclusion description in buffer size calculation text
- rephrase tx to refer to the rx side virtio_net_hdr consideration
- addressed comments from Xuan
- replaced 'field' with 'structure'
v1->v2:
- addressed comments from Cornelia
- rephrase buffer size wording without explicit length of virtio_net_hdr
  at 3 places.
- replaced otherwise to ', otherwise'
- rephrase non normative to write as driver normative
v0->v1:
- addressed comments from Xuan to rewrite tx normative


Parav Pandit (2):
  virtio-net: Fix receive buffer size calculation text
  virtio-net: Clarify the size of the struct virtio_net_hdr for tx

 device-types/net/description.tex | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

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

