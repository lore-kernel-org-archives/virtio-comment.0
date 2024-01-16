Return-Path: <virtio-comment-return-8946-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FCEC4707C
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 05:43:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C1E2C217AB
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 05:43:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AF70398672D
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 05:43:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A11EA9865C9; Tue, 16 Jan 2024 05:43:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 84140986591
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Jan 2024 05:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQUoKzCYbtDYvpCNuIrm7T/44AOFdxJcdRwK/MCc5sSsWJLk79IjFjdjtITpT6Pzb95PxWJjxPD2qli8IlpMYfLmm8cvVwCpafEpuujEiwjT8hsKPq/xUVMfhqFuYffTPKwoQsrRHinb1sLvCERRn9l4CYYKEUswcAe1R025TDlUEHpm/WGzelTPUnXO36dtQKkhqDXw7Xxm+YS2V3c1jEGxyXLm0Iuq0RUriyi7J1KzR6vtTVxTfvxCPHVnBFpigKMAMyF0tNQlWq8urM6zmDFASqg11xipynGb+Fg915P9/yXi5CXM64MEczB73WtfPx1a01Ckdzf00IGeTPNKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6atgJ5WxFTEuZMa3V/5616dKHAa+tGnv8Uwe7sAnAs=;
 b=QMWGAQnNj4Wca+2YpibdyizXHrvELVjNn7KjI36FdHCynxa+E6k5zgJtNXQKZ4IZLM0iu7rrgc8mIud2iCiqOGXaYsKNo/8RZLaKt/npjR0BlTa2HlH5LHyz+tk6vC1eReaqVNz/hYhWhZOjUGp20onfeL+zN87shx9jbH+qmyXtjoiKTECpuXwmerVilWgEBojwpmUmTQR1CR20xFj1dTfVh4UDRTgIqAncUJZ62ZjjBk89Vjxd1Sz7ChtU1RbMx6UPGpWNtua4Jp00RUjDSg5ihrgQnsX7l/4C7uCcIvBX10DHBqzcXnYT9AKBpfIBoElC7ar4+OKDdJC4fo4yXA==
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
Date: Tue, 16 Jan 2024 07:42:34 +0200
Message-ID: <20240116054236.3546213-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|CYXPR12MB9317:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bcd6071-75c5-490e-565f-08dc16560472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JSXgNp8dndeZbpQGvMQfljdmQvC4WeZRoQpjFIPOcs8E5/d1Gf3krzdlhl3Q+raKIaRSwn0TO65mv2uJrboB5Ti81+gPqphM0gP0VyqV7OdUOcz9Jc2XoODiumQGSIgboO6m7zzEANVWy9zfWWVf8yjwR44orX1xILwRfkj9+rr/wlRyffvbv2NA25TIEmqkVChnIflyQUt/IvDoTkh0aoPm8v2AeJd5F3niSl/xoy1/nidhHwZI7ajoCMVugIJZSKl87+kiibeb5frDUsIE0zzk5y4M6wv9faX9Z8ccrn2YQz2ujpswXKxYsYYblKYF7W52ABtlNXyMH+mLFAoYiiAf19ZBXHHXP+Vm7ZN6knED4121bSxQB13F5l6TO502A/NToSooUTJg8D6iGE9jcwzC1AtPKramOrJNZttFvwgoE9DRv489tmCOBQPbBsmk7I/qYOBeOyfNFz8XzCSlblq9AnSV9IhAjUhfqMoExWxx6FIkhKfm7NOdgN4cgtHITDQ8T1gc2m5VzjcnW4zpISUO1e+wVdTWC5mqzZF/ZGcovWsgjt4nTMdvFNMRte+n2guzLkVoKw6Az4Dw93tVmbCjweJHtc6xsUvgH0xDE5SnmbeNt8A/OnNguzCRDToPA3f07y89OMvDD0wNdnpefVQiG52cEsrCpSK4j5X2O4bIK3Xt9ltoHYrJsMOd8l8ATbxVoN9d3amerNld6IuVieaf++sjtUcaSkFpNyYaz7pV7chzaj1lU2LwzkJgLHH3
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(82310400011)(1800799012)(186009)(64100799003)(46966006)(40470700004)(36840700001)(70206006)(70586007)(36756003)(110136005)(316002)(54906003)(6666004)(478600001)(41300700001)(8936002)(8676002)(4326008)(2906002)(356005)(83380400001)(82740400003)(7636003)(5660300002)(47076005)(426003)(26005)(40480700001)(36860700001)(40460700003)(107886003)(1076003)(336012)(16526019)(2616005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 05:43:07.5493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bcd6071-75c5-490e-565f-08dc16560472
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9317
Subject: [virtio-comment] [PATCH v3 0/2] virtio-net: Clarify virtio_net_hdr size and rx buffer size

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

