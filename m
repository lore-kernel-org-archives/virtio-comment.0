Return-Path: <virtio-comment-return-8926-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47551C47258
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 09:32:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AA6E7190907
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 09:32:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A121298671B
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 09:32:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 942659863ED; Mon, 15 Jan 2024 09:32:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 86C9B9865C8
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 Jan 2024 09:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9vhFKv62l8va4+xEacmybZQH1RWX09uLAUSbGCqQV5WDttLOALAVr2CQ3al/FA/eXVw+xWKVj4QQbItVULfBJZ1F5KNbl0T2GhfJEbhSe7OtULcBeTPtve7cmACbFRM9WNPLVGAhcD+0nFCLmn+VwgARhD13jvHohRCEI40Uzka8BCGWNklTng+6yRJv+WBrvFM304EwGDtNEUCwH8/ji8Obu+xXaGxnRhhFz66H61msJi9eT6vT/n0Hs3tvlvwe8e/1K5l+49VCheEJxPw+n2EFvZlHOGUUtrLb/hwVG0N02THRnfeqoC8ZMhrTnShqlWKM3Tte69jVxQo5bL38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xkxo78bZSDaLfB2rN/ijmtkarKfc//jD0JbpwGjQ/Co=;
 b=h1DE56C09gmKXpwuxg5cR7akFX0VrPsSTevB8nnvfJUK7XXbEGPZJGhyPpkNFtoiag6l0Vpgm4bb2LUvoR9uPJ2Gxqalyc2ubolV7wjVSHB3RR7eUIEYY1UvrBqRySMnw6FUJZz6Gbxo1Z1sECUEv8iC1F4OBChU/rRGfTyO+PTNWJOtlETrzMS6bBLNlRYnbojyZTUrmo2SO6qW+aX6AADRRR4ImWktFKLoQMInAdqlHeqi7tE6JeIs8ucrQ9wxOBqRMZMwt8MRpScBm0XlMpiimB75ohTYjh60bAmKAg1jMN4FRAoa6PwRT7PFPaDw66NQuZkvYrumtY44pQuCag==
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
Date: Mon, 15 Jan 2024 11:31:39 +0200
Message-ID: <20240115093141.3539316-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|DM6PR12MB4974:EE_
X-MS-Office365-Filtering-Correlation-Id: 13dab123-fb8a-4611-a827-08dc15acdcc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D6mVxn5YintRANISpHeVOxqJU41vGr82X3p7p9QWOeoHPKLbCgnrloaocGoi4vaSlG2PrgJly11R3JrwvEAoT26ZIyOOhozsQ0qkKbPZUjxfInxHFgroyVNg3C2pzOpthRWVKCp3BGgL+nUMsXsIXBWyGo2Ekl3sHfL4Y6CFe6aGIgFKiDT3sWjLN3zxCYcAXVMQBmD24r2RhIMWZW6pDxgsEK9lvldubnSRGg4EZVDXawx7TiOh+7LY3Ncpl6mIhtT77mEvCEJPTQK46t1FjlH2+LBF+KuLfpiEx3rnY/G+2Y/+2JZe25Yfo7p2OclLmTlJSxiGQcdKGBWm4A8FwfeUbA7d/SMbL9kohbT7TtRxzzXE3lbUGzBSfRg1aIafm87IZzAPlxS1vsVSH5hMQOycRJLPoyM9m7vVBv21cjbppjqZZ3igAYxrDUM50jJe3pG0k4eP6qvpIg14m9JhxXKKNNiEJY5W8E4KUfEWDl1o+2Y3et+AQXjX1fk4wAe91KKlFOjWWHC8gU6xuob0CDHZouBTRqbTwo5/Ne9RaubsGkl5xTht7tJPld5ZRiXC/Eiz3Oc/KrVAkMtqs8RSf4Rpyv9yclU/S6w9B50lDKEkXcDfdJaWceBfULgYXjDv/rNKsN8Cy0eTZWoXKNraEHnyi1XsGX5kRE3h6Uxw6p/magyk1yveCQabtkQHRVmWdt2Du62mV4Zof0zAZApsQ9g6smKrYcTNdUWFOPCu7Cpt6Yq+AdFwwI0ULCR1IDaD
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(70586007)(110136005)(70206006)(40480700001)(40460700003)(316002)(54906003)(356005)(7636003)(82740400003)(47076005)(8676002)(86362001)(478600001)(41300700001)(8936002)(426003)(4326008)(36860700001)(1076003)(83380400001)(26005)(6666004)(336012)(107886003)(16526019)(2616005)(36756003)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 09:32:16.0432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13dab123-fb8a-4611-a827-08dc15acdcc8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4974
Subject: [virtio-comment] [PATCH v2 0/2] virtio-net: Clarify virtio_net_hdr size and rx buffer size

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

 device-types/net/description.tex | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

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

