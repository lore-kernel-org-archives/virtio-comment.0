Return-Path: <virtio-comment-return-8329-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72444C4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:41:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E0BB421188
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:41:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D7CB3986D0E
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:41:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CEEA3986D03; Fri, 10 Nov 2023 12:41:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C16F0986D04
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2idp8ec6xQH7+S2z6ou6Cpk+XSfYyFKRbm/OBbQgMvqAiQQc5k+tjjcAyG62deTcVO9dhrFT+BWvyw0BECztUJf/EAvTY8T2btK/f/ghgACamjuQvnTlLqbnkY9QkhUNpf8eyKZ6w36/8PFLv9maeCQIBEdPS3uyfi6KSzHPaBkw8I2SRNcwDqwrAwktYJPCSkxcYbbg6MxnNsGm4Jx9LLNWLVtEEC0C52yrh7nZgRmtpcJJUyUAshbszwnTxleUSZgDMU5PycZ5Xgz+B822u3w+x9zy04wmCvNXvDbCNRATce5nyaetLMqHiYQNn9b6KvcFTXpwI65dNYcyx2TCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJGDaZR5vf10Xrlt894mNkShV6ii7kL3R6saXviUB0s=;
 b=jqCX6axQpXClLsTW0U9lZDAqg9SyyM0wE5v/tx6YWiOyOrFSRVXZnZN8LpKnoWVHnMa4cIk6l7YiLuiz9lPTtPbiuOS46aG+vkBs6wdvmHYYA5KJGUrifHWW7sTxLfwnoGgmeEihgeIU8S2iy97+dNgrGclCCrCxBJiuDwSNeGaRLlMxAZQiS3Xjh+V4K2R7e7nykuVbnD8gDmTkvxLocMFOX1oVTEG9xlGZwhEm/V43pe/nxLZ8wYX8ZgdZukObsdjBSCGVeRGTE3wz19QYWS1wJUkP4IcLS/4RET1roxM9fDtgCWUz3JtnryXnRHEtv4R0+0UgtWIWQ6K8BhGBmQ==
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
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Fri, 10 Nov 2023 14:40:38 +0200
Message-ID: <20231110124040.2093394-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|PH7PR12MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: f643ad6b-37ff-45da-e3f5-08dbe1ea50db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yEyUrNpT4unnzdf4zDbXiDzvRQVwaWjUdAz2woTRq5IHeowrN1bnAYfBI0MAnn9JxMwMhQ8Alf11SipmBjrGhyCEB6ASF6Y9aVvzZEx4ut2fNbVvF1rSUPSlaS9YZ/Dk9smwq3RrD1bXXsLE37AmID2mLYF9JU2eJzxv4AAOYmpNjPbLI+830NYDFQf0ipvZmfq7utpZCpvx/B0Ni4FhTNp5SrdFJJONQT88iWMMiD62escxoFeSC4vzdKP7vGHHrBptMO4tndgIezCSlN7P1yT3DdsZQsaAp1ZKCqeeQPRznhCDsbpI9UP3ZF8jfDq8Ej9zcV631FDftriCl43PcFcXTyhqDoz9Hyfzao3tNyHC8BhWLr8qymhkLc5dkN61Orw5GdPO5rtjyg4GYJ6H9F4GmbTOpRKd35DZ6zjOynMN3cW1jIM9BKXp5jjfXwOoN7QL7RSg/QYkiTHbz/Lkg9KJ28M7IO1nuBsYj0doKDW6EqARDNySfyERPbZ4bhap8xLGKZR+lulnIxh9R66vXOOQjnqUzXg0vKAAPDmXYdESxilQdqfh3YgxX9GLidEBY0pogLCzluga9zcx0I2fvAxRAI8qxYc2FFR8uHDPxg264X4FRaswzRQFkfe0DK501OQq7pKUn9r3voV22gQQLTYDJ1KQeWjn03se1XQvDGwctIFT25yWZOTPNJuvUsfpK99Vbcpw0l4CnT2qPq3NQuZ9cZ+o5mxYQC24kUfGyJ/Iz2nQm/X3c3/37xLi0mAoI4dPQDSJCOT4G0Xc9RAADKYxTiuqyJ7voYK7ncsHzwS5AR/gRKe16mrelq3DwocD
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(426003)(478600001)(966005)(16526019)(107886003)(70586007)(82740400003)(2616005)(6666004)(1076003)(316002)(70206006)(110136005)(54906003)(2906002)(8676002)(4326008)(8936002)(5660300002)(36756003)(41300700001)(86362001)(47076005)(36860700001)(7636003)(356005)(83380400001)(26005)(336012)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:41:09.6835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f643ad6b-37ff-45da-e3f5-08dbe1ea50db
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7425
Subject: [virtio-comment] [PATCH 0/2] virtio-net: Clarify virtio_net_hdr size and rx buffer size

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

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/170
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183

Please review.

Parav Pandit (2):
  virtio-net: Fix receive buffer size calculation text
  virtio-net: Clarify the size of the struct virtio_net_hdr for tx

 device-types/net/description.tex | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

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

