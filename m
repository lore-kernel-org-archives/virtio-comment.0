Return-Path: <virtio-comment-return-9092-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80492C4828F
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 11:56:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D3CBF2A827
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 11:56:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CFEF79868F5
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 11:56:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C4EB19841A5; Thu,  8 Feb 2024 11:56:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B75799868E6
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Feb 2024 11:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1707393370.558000
X-TM-MAIL-UUID: 8ffdc6ab-84ff-4203-ab65-4e734372cf13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iByZy2n0z99VCbeC5fmn5WKb9AoXlHfG7rfVbk7T+Xc2D/Q38cGJxOfkKoj2iqwFtKj8vAhJLYxMYlRVu+mL2EPIoPlTVf7l7PKv4iXK5hcpC4RdCIfJFLT2wINos8Q3FPi641acpBjBLMVpBQMSOFOu17wRKIGUbK7G1sDK9XHzfrLwcSNnRFlkf5YmLwnaTGk0sWbhR2H++PMZQD/k3cQ8reBf3nMnZeOzKLkSgESWSSJ1kAVD1s7Hx2jhOjAOBhl4BjYPEyT8C/kDdLdRL5YUsTNmbHwKqxHrjyXWnazp5QtIAGXlIcS6A+EZAC9m+LlVZGgkFyIbbLkeYReGRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmNrHxDEhs/GDmTlW7wbBGHP3+nFvuEaLaCaPncYdSk=;
 b=karLQVMQmXu11CrGSauExjpPhzxbOryGzc0pBUnBtU7PwPbEuqZfuCgZm1o3gp1/skrH9bnSZPVUcm11zrBhqLREvP5nZHVt9jDDTKXM9REekmADPGK6zwfTCKOMF20hfKWe40MdvqMsKC5zOAquMbo6ZO3hxM3S/G2BIe5QFU1P02Aqt9+4VMqJln9Q8q/v37di3663TJ1ra+pEk6krTZcWkpcQ9VyMkzTtcSuqHxE0Olw1nuY61dCRBwpt44T7IsA/t50UqsUEk54dDKSri1rwarVz4Y0IbA9RwyENVvYIqtHeQrqMMQFfZCf2hasIdvisQfLHvPH1/VNn32h74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.66.60.4) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=opensynergy.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=opensynergy.com; dkim=none (message not signed);
 arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=opensynergy.com;
Received-SPF: Pass (protection.outlook.com: domain of opensynergy.com
 designates 217.66.60.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.66.60.4; helo=SR-MAIL-03.open-synergy.com; pr=C
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.oasis-open.org
Cc: Peter Hilber <peter.hilber@opensynergy.com>
Date: Thu,  8 Feb 2024 12:55:44 +0100
Message-Id: <20240208115545.30102-2-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208115545.30102-1-peter.hilber@opensynergy.com>
References: <20240208115545.30102-1-peter.hilber@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|FR0P281MB3328:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fe11abe1-6d7d-457e-acb3-08dc289cf058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fAYn6GHMIDBtjN4b+ktRMAtl3QDeJhv62hCwKX7dIqAh/sI4I5KXSxLnT3UUX81pe59J7rgyynbTHamYQ5KMKiBNfBPMZgNz1jRvkmBQTm5+LCweWN2XynSgCxjVL3ThscRkBDUoAZdtarHaWdvvo4QBCPeVtlNBn/Be7f5rkxe8DUJsTHmxq3YzKQmoqrOYroy2BtdrSV4x2AVrc7i4rEqbIeSNEeeSaDCbLQzjYUxPUammkNjDQRLRLROprX4RMgxIo2nzhIE70AOzYeDPcBFRIt1wGfyLR783l+TLpUDowjEe/KqsMK3mpWYh+Ibb5MRK+yGoAyNKai9dUm1XLmwrDPh1tgQVB0zYD1ASoprswW4lCU7+ZybE9Dpevdz0o2SUUJFPXH/WtJcjyHn8YgkFMCHAFIxLDFn5eqZzZOkU5AloSmUy4FuZP04QdKR+pXximVLAxiXpo/FimSP0dqlmdlu+VSc65oMsBq3BWdX5WxhlHHYuPW7RVQHFM6ps5FrAp5qtpNbJqIgBZosbWXaGHFgikOpjue0kuReZ7UG/8uhLvWZZspVf6vTvSoZcfTxkkXwWFcKBAcwbO+S6SRC0mijbjcWbaIFOUF8XPs4=
X-Forefront-Antispam-Report:
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(39840400004)(230922051799003)(186009)(64100799003)(82310400011)(1800799012)(451199024)(46966006)(36840700001)(5660300002)(41300700001)(8936002)(4326008)(44832011)(8676002)(2906002)(83380400001)(81166007)(86362001)(36756003)(26005)(1076003)(107886003)(2616005)(70586007)(70206006)(336012)(478600001)(6916009)(42186006)(316002);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 11:56:09.1026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe11abe1-6d7d-457e-acb3-08dc289cf058
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB3328
X-TM-AS-ERS: 104.47.7.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28178.004
X-TMASE-Result: 10--0.258700-4.000000
X-TMASE-MatchedRID: MwN0zTUhCXFHh0q2DwAXLuz7sT3z+1wghi9GR48RQB7AYsa7JwqXV4ba
	F6RQTZz9QWrwTQcQ3Z3/aUWAnMYE96o4G0VKdf1fC+mr+2Lx3Hx+rvFZ7FWrXBjX7ODA5utXDsf
	EtxLS/Tfm9Tc/GgfFJwFtWueZlMH0QhHE9wZpzVy69rtClqkCjesCZSpF32VZ5uJH6mHUCRnFkD
	gU4bJS7ZSOrI9UPIE0RG3XcQ2e+7THXSTxCrKgDKqJbIe5fXLQo4NJa7SjFsrqB8q0DtiGWu2bI
	S/HALlkUnEr/yCRxnNkzeNs4Fp1DTnxJqun3snzbkV4e2xSge6avYfw27DAk0v0WaECKt8hNm9b
	oNDkwVpXc/r0u7Mwpr7rweoAIK8o
X-TMASE-XGENCLOUD: a3728d6f-9a73-4190-92d2-88281ef5dcf0-0-0-200-0
X-TM-Deliver-Signature: 52988F4B2FEC1747A5A9B73C052C6F3A
X-TM-Addin-Auth: lz5e6wevyr35jCxb1DoRcFeTRGzrWzOeFyKdhNfxzaJQjwroyMSvAUdFRaV
	dT+sA9W1fSADKZogSK+vJlJZVaR8ld6qBmq0UPV7m7jOQGauS3C5MK3IHXCeW7b55xB694EZ4wQ
	wqhdgau4SMV36JRu24yD+wnMALMbSUHNmaEB29jpGawHLLwqpdu3Z8BmL0zNq2AEbBCvtTXJ6zW
	VFeF17ItCYge+7tDhUzf5ANn+gRjnoE0VhJykGZSXrMglVnazPZ4XAbfqV5dX3wCRjh/vYiec7O
	cxpC39l0XbcuDGY=.ysoBG4o15vdk0Xdam/DmKa+GPa5HXU7HtB38EYYk6+L2or8szWATObxpE1
	UQZsN22pFZAGgwkLEHUxXvgz+JqX03uFUaeo+HR1iXZ/KmOUWiPwZQZH5tm4nQz+H89jSrdCn13
	yGq68cEwDeqNBenBAdRuSCxd6CL5WPQTYYZ+qeP4lBCwYc37ridyhDedNdZOxqN7OL/mVjbvPhp
	bw3qmdXo5EvBJu7EzzYJVziVXHa7ggyJBssL+3CU/C3UBu5nqlEx5ucvTjSQR+cjCA6hPnfiLqa
	fWcHQ0p9JBHsKk9GO+2xzg/Vpaha6y75wmpq/bxISr9pmWROxFVubsKO09Q==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] [PATCH 1/2] admin: Refer to processing order as "limited" rather than none

The non-normative section says that administration virtqueue commands
"will be consumed with no order constraints". But actually, the
requirements stipulate a total order for all commands in the same
virtqueue:

	The device MUST process commands on a given administration virtqueue
	in the order in which they are queued.

	If multiple administration virtqueues have been configured,
	device MAY process commands on distinct virtqueues with
	no order constraints.

Rather than "no order constraints", refer to "limited order constraints"
to not mislead the reader.

Fixes: bf1d6b0d24ae8 ("admin: conformance clauses")
Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---
 admin.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/admin.tex b/admin.tex
index 0803c269e5c4..54f18c255fb0 100644
--- a/admin.tex
+++ b/admin.tex
@@ -458,7 +458,7 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
 virtqueue, and they are used by the device on that same
 virtqueue. It is the responsibility of the driver to ensure
 strict request ordering for commands, because they will be
-consumed with no order constraints.  For example, if consistency
+consumed with limited order constraints.  For example, if consistency
 is required then the driver can wait for the processing of a
 first command by the device to be completed before submitting
 another command depending on the first one.
-- 
2.40.1


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

