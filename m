Return-Path: <virtio-comment-return-8890-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB66C3DA6E
	for <virtio-comment@archiver.kernel.org>; Fri,  5 Jan 2024 08:01:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1FCCB2ACA8
	for <virtio-comment@archiver.kernel.org>; Fri,  5 Jan 2024 08:01:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 12404986686
	for <virtio-comment@archiver.kernel.org>; Fri,  5 Jan 2024 08:01:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 05683986603; Fri,  5 Jan 2024 08:01:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E94C198662A
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 Jan 2024 08:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ca7FL2cDjyJAbXangsNS7hy9IASP2kAlajzIcACqlSc1La7/JvZiMV2mO1E73Z2JI0O9avbgBhXhaxKepMUhDqCDJdQdZbtZX3hXuLKrGEQUXHwCt1w6qR2y4lca4Vkia49GkTj3YjkmzPVgNXTfFv68l8CcIl4KkLR/Cnokx9acuKKVDwGlABl0+URp8aC6EGo6cwX4sbfjRgKuv82iymQakmWWw2T2pQ8QtxQwh4SWDarLxJ2bT6g5u9rb5tIXK4s5GjmstetbhSdFqXNxOD9utv3NiIa/NvSgVMJpigtyWxcRqbaxyaFNe16QT+CK7VcwMJVxhTdEDj83yaB6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Aq/7RZC3RQH2KFPDACBEpQvHuNmhtJtZknLaltWYE8=;
 b=NQGUCm4SHL8SQ3jfXw3yyyN1awW2fYPMOv7DxA38V7JOepFJYLKx0wyD/I/Es1HuilwBnx5l1kPxLEMVXHb1fxK0R6uv+0qNYnCzh7VF++fovUBac6oLzl0RLcIXtUXn5u26MsaY3TD9Dd4zL/kxmLjdZEZ8sJBxd/A0x/yu/kXfs3kn4O6+MxqUoa+KLxgaIgtUqRyyG5Kz4ZvPH9JF5ZSI9cVbb35IKrT1K4gi9S8AbgWGVGTfUbcZFyKsEd4AeVHQxV0TXjuNaAyK7VAz0Of1ACva5yJnpu9cCHxAuWRYJ6EH8XGSw5x5EA3c/pn7pM84i3cKdVztC9p1iqBQDQ==
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
Date: Fri, 5 Jan 2024 10:00:53 +0200
Message-ID: <20240105080055.3459531-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|DM8PR12MB5446:EE_
X-MS-Office365-Filtering-Correlation-Id: 116ba428-b4fa-468a-1351-08dc0dc4872f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gHi3YPgHfkTMGSfv1QTUUjVtThsHufkf+FzGFU5OXSHW8TIF06n2pavV/Ih+hasZ5SQ10itrFDO5s+MiZL30xcOqFhX5KicuXhBXzB96p6ZhiAoODnHoPacS9FQWCf9DU2zyDuHQE8N5N/p54LUup9luDfdgPKqpPkL0IZwusstCS6ZfBN72uVm8q27A50gQGVTkgQvKhE28fAB+1CKp8PCPXepietD4B9pSE8DSpDjrSafrKjcOPxgnQT05JpO/X2rbUjXeRyw+S5rIenbp8C6cUdkn4NyoWMblUPd3X3qtyWg4yInEeRpnZX2tidiORTmW81xAmmzYCZ9WVdDCQ8A2kEHtdfnOVjQdZq+1maOSZZvuGuzH7E32jNHcA8Hzhu+pbg2Kq+9G7iuJUioS5Gg44F8RNozoyhPQ9ObUkB1T1zGtG7Tn8nstQBC+7+a2x8Tru8oxwZ3eXlX35/3h8J6pWMsDCjKaU60PoV3qp9laKH7UzuZ1Jc1Y/FGpfKfisqDA0qzutAvgr4fJj7k9clztFe6ZrDPjX+2sNAZpPd9A/Iu9xwdeu3pW5r57pQ0bWb8Pc8tcdoqkIytmI5wV+aIW2RjJxl2ra/LBdIXEIvPtGqGq2OADipmgJRbXLsxs/H/Z+cYjSmKciK4Ge+5vERKUiB/aoNrQglmD7UNBXaXQOwH6zAsdGh3nv8yt6D4qSJTwCZ65ceJS38W4jlYhgt4OaX9RO1Kqap6MT3ldB/o4SkaK3f54ExkK6AZKNJse
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(451199024)(82310400011)(1800799012)(186009)(64100799003)(46966006)(36840700001)(40470700004)(2616005)(107886003)(336012)(16526019)(426003)(1076003)(26005)(6666004)(86362001)(83380400001)(4326008)(316002)(54906003)(110136005)(8676002)(8936002)(2906002)(36756003)(5660300002)(478600001)(70206006)(70586007)(82740400003)(356005)(7636003)(47076005)(36860700001)(41300700001)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 08:01:31.0496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 116ba428-b4fa-468a-1351-08dc0dc4872f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5446
Subject: [virtio-comment] [PATCH v1 0/2] virtio-net: Clarify virtio_net_hdr size and rx buffer size

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
v0->v1:
- addressed comments from Xuan to rewrite tx normative

Parav Pandit (2):
  virtio-net: Fix receive buffer size calculation text
  virtio-net: Clarify the size of the struct virtio_net_hdr for tx

 device-types/net/description.tex | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

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

