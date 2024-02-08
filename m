Return-Path: <virtio-comment-return-9093-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FEFC4829D
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 11:56:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 730D122391
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 11:56:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3012798692D
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 11:56:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1A926986913; Thu,  8 Feb 2024 11:56:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 031119868EA
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Feb 2024 11:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1707393373.579000
X-TM-MAIL-UUID: 12f47c4e-1d70-41be-af67-7d3cee7fbdc0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTWMqcZrgRlmHRCpGSAwrvUG6HHfVh5Kx143W++Sp9P8L7vBtOf7LmCjghK1loLOyhgKEK0KQ9WZo9KXlQu1Sa7ibkU5+ByrlfPvp0X+KgZeIj5WjF/GUDNrY5W/+6UVp5dchupF+z1s+3I94Imt6Wd0giJgpP9KVYKtw7hDZW+sRK5+CV8JCSnbj1dXxsNZ6r+Pj7XwcADcOhXrZAm+hstOlTMuBiQ/53oprwbu0O8WWwjVciiiWeTTxotxIJZf9Xm7LSxKwYB4cIGAQqU7Jj7uUC4X1IckNKazDEYjIlS2PSEjHpCD1Sf5ncnS2Yeo5DKmeB9ju/rjsCE30sSdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjrWV319WNWY+o04CrR4zWGYxAeuCm8ja5KwzVeY6hE=;
 b=EJwEGj/DOgX1An9zE/DPYpex/FD3gbDfDP68CNlSJkAFQEGjfL78jSESfJn/zHUy5a1WnQeKKDKtl4MxtUEA5Kry7gN75C3qJzZXVP/2YOksigyYBilaI/Qzd+zw054vm431DcN4x9m+8AF6T3weXsC43mR2pECyxAuUZ0rKIqr30bXoY1NVIOAUn8yOPhBC8cxn8bTRB8EB50S2J+PF+JsODsU5eGKLIiPUeq283Fi9R3VI/cKUbGOQrHyxQc2QRLKiAUmaud9m7lBWtOkk5s2C0W50UPp4Qwh+PV0zdmJ4+/A8V/agdk+AkbqNOPzp/YORJDbn0Em9Gpzb8ovtIQ==
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
Date: Thu,  8 Feb 2024 12:55:45 +0100
Message-Id: <20240208115545.30102-3-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208115545.30102-1-peter.hilber@opensynergy.com>
References: <20240208115545.30102-1-peter.hilber@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61F:EE_|BEZP281MB2390:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a9e66352-b1a8-419c-5406-08dc289cf0d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vCuv5601jAa8ZJQ0Sm5mncsmFoxTBvhIBzE3ErbAG4Zyb2JIBS9Qd9M8oNYRoAr6Kaqh1skQiCu7XE3YBnBNBReCiW3ROWd11Xx0dUl5edTo9RZwNJlLlXSW+a+Uy4GgBC7V2vtyz6hqjv3X1QdGKQt/BMFsexeyLYhulsFQo9fMQWs3MvKVZh+Yzc1L+EFaqi2M70ZXFuisAZ2cQtPplJzxiDVYgLeiFgb6N8pK0Yu9QlZkQwdtI5+XhcP4vm5ijNCxYZUKSZs7h40Qw8kL4MSt8VSJqxO34tjefvdGFWjZ3IvbociJ6zs2fTW97hz4GKfhRuimrD7FWIHcLS17FeV5DJLl+dk9hBnOBgsMAgjabU/x1Bi/c+/S/55g2kjnAwR4pD9YFx/bkQbL3HN6rUBLDtOYbGdE694H9JUMvXH/xuzPpaeAlez6m7LxD8N0ct/E5sFYhTdSXtkZG0DDxvKackos7phanCs1fz0WEoMNcn0q20xa1+Hjnb6qddnuoN/Ut8TpSE+bAL0zfscqSa/M+r1qP/ffNwslOp1cQiGhhxLQ9upUX623xtrIKrZRGCck9ua8WvLnmYxiEX7cB4zeyz2DHwGTJ7Xtl8Z7WSQ=
X-Forefront-Antispam-Report:
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39840400004)(396003)(230922051799003)(82310400011)(64100799003)(1800799012)(451199024)(186009)(46966006)(36840700001)(81166007)(83380400001)(41300700001)(42186006)(26005)(86362001)(107886003)(1076003)(336012)(2616005)(36756003)(4326008)(8936002)(8676002)(478600001)(2906002)(5660300002)(70206006)(44832011)(316002)(6916009)(70586007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 11:56:09.9170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e66352-b1a8-419c-5406-08dc289cf0d7
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2390
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28178.004
X-TMASE-Result: 10-2.190100-4.000000
X-TMASE-MatchedRID: OXh+vcntO3Cmk9Ke6CN7uZgVeq7CYXzT59KGlOljPvuOspAJM82OXQk4
	3PZ4fPrqlplw1dcdxwbvoLs4q3Jyra3XYtsOH2/QRYNhzuZZjRDZ/IoKYBoUVqloHyDFpaEst5O
	JHXe84WR7hnHbAOC+BOsQNAL2u95wXDp6qYMvm6sRLjqoJJt/9Ye8/oJiio9KA3+iPIxcfrapzS
	sOeusxOH9w7EiEveRUv9rSd36EgUIj80Za3RRg8PIqRO68YSApk6uuW7nG6cXKMJsWJVVbL8tDi
	jg9RNxpicqyhoTRguE=
X-TMASE-XGENCLOUD: 658bbbdc-8fe6-4d20-aed8-b0024d89b054-0-0-200-0
X-TM-Deliver-Signature: 18B15B2B5906CDC4AD1AE14DEC35EFE3
X-TM-Addin-Auth: 5D+lP0nRkf26Mx9HHaXVsf2RA6BqjNljgdDechjhTjQn1JO7ytBdSXDLqK7
	fTykYtbKQnqhCIIVfZfupSTcLBTwPToq83PEtE+yF1SUL2nO1OWheAQd/SYM0WrdWZwY+EzfXsZ
	aOC2icdTAe8a/F/QWu+H5h0pXhLDA4W58e4ketZYDy3YKOqOxsw0ZJkbCslapBlKVHzVQ7rBGwA
	0etARzeZTEW+/SyXOM+Zg+m47BJkj++Dq8HLC7ayuIV797wzyzkgc4RVy/UP48+JKBRN4bSPa6C
	B3qROh+UwwOH2u4=.0HROLwCJiGFWtZAfUOns1WVfMDmTL1Xt0JGwDWgrpWOlkfeRDMWAkp5sEo
	UiEeLP+tXza/sK94c3S2CzScb7LgymLR9I1wxoqf89YUbFkH6LhDLBH7sFvTrvOy+irILjxFbF9
	7rcT1FkfTrD3jsalli2k60BZT9CYexXxGK2+S8e+vWUtNSTQrg5alMNR1xUXPguoroaAxA2JJ22
	CQprRI2MZxXTQYk90oP32qGooHejEs+euY7R1vYhzquEiVzRUmmsh/ttzUS3olfNlERm1+RgqXP
	H33ZgGRWVUxUy1MyzgQqotQuFXOUgjFr4Roem8gNGk0oM5OWl3Qs/fFBaIQ==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] [PATCH 2/2] admin: Fix driver requirement subject

The driver-normative section for Group administration commands contains
a requirement on the *device*. This requirement only makes sense as a
requirement on the driver.

Fix this by making the driver the requirement subject.

Fixes: bf1d6b0d24ae8 ("admin: conformance clauses")
Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---
 admin.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/admin.tex b/admin.tex
index 54f18c255fb0..41cc12e4e12b 100644
--- a/admin.tex
+++ b/admin.tex
@@ -582,7 +582,7 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
 of \field{struct virtio_admin_cmd} that are a multiple of 64 bit
 in length.
 
-The device MUST supply both device-readable or device-writeable parts
+The driver MUST supply both device-readable or device-writeable parts
 of \field{struct virtio_admin_cmd} that are larger than zero in
 length. However, \field{command_specific_data} and
 \field{command_specific_result} MAY be zero in length, unless
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

