Return-Path: <virtio-comment-return-5717-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4824FC77B78
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 13:40:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 630B3EEA09
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 13:40:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F90F98667D
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 13:40:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3DC2498658B; Wed,  3 May 2023 13:40:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2A454986594
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 May 2023 13:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Virus-Scanned: E-securemail
Secumail-id: <92d2.64526431.113c1.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzoFMM4yDcR5CzZYEz6mNgxJiFaxJGqC1U7h62S2ASdVithVFCzJ3o9sHgWXChOMJxsRKCG4n5OsWKn4B8wqquPtNO33q7SC5gw1ov4OJj/RmuFE2riNEZ8Rs+VGPDVbvFbvw6baJrcnWQunbYN7FUqIDj6UukRFxIBPh347KRUJVk5Xq93r/PukHz1hVrVKVB9xZWSMRWBI+wIcZA9T+VKRXOgqkZPOXNR+jvU8x5eMASPNYcQs+QqDzEI2ktx/YDVGlI4QrXfySSSV9mNspENsOxcbbgwslYbJBtzaaLHTkhe0cb+FpvN/T+ekUUg30Bg4ZFgk4yYx7peTPKDwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lmg+fboIBMkHHp06E97FZ7H5HACyyaORISxfKzAzFKs=;
 b=L2pUlCVpwGs/xNkpeAPnfD44NBpKjsXqX8NSKqxwuyCA0hs5Grbuq7QYUOe099m5xMhilwizoGQh4INcrzm59i4YQ4fafAnOI/hNF8LKovcOdgaHWKudKzLsI+YGute2460GkYlbUWlJjRveThArxj4q3PWXX7WFFh9jMK/a8ix/eQCGz1G/NvWvEJaLg3LI68W6mYE1O/a7TiBTEW55WI0SirSjEh7uG/dbxaFChWUKiEjv4c5wKxp0Sbau+b/1l8GjcsP2mBszQwawqIgBeYjVzTogK+8qhV2AoJdWIbE7C/aEPp6LrVg0ZreFWzmc1nbTqWR9NRJ20m/aXLuatg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
From: Cyril Germond <cgermond@kalrayinc.com>
To: virtio-comment@lists.oasis-open.org
Thread-Topic: [PATCH] virtio-net: Fix virtio_net_hdr struct size when
 VIRTIO_NET_F_HASH_REPORT is negotiated.
Thread-Index: AQHZUBws9xErIboLTkuPTmBRBa1so69I6OJw
Date: Wed, 3 May 2023 13:39:59 +0000
Message-ID: <PAZP264MB3888A224F87ABA76501F3CC8C66C9@PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM>
References: <20221121090212.645-1-cgermond@kalray.eu>
In-Reply-To: <20221121090212.645-1-cgermond@kalray.eu>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-gb
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3888:EE_|PR0P264MB3423:EE_
x-ms-office365-filtering-correlation-id: 4f2d1fbf-b47d-4257-24ee-08db4bdbe3c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yUk5e6Ag9XS5AYfqaQVhp0vKbhcfIH6IH/vEsqe5IgJy5SKifd5h0US4lA0u1psCpspAq1ImSAGF7UA7ykVcvjJaUXUBHdO5stM2giGloa1jmZsq772+mWwgTlbY0h+dGnogGThS1tzIt1/4DEG6qeWDTzh/0b+y1JfIztw3OFUtvV2NPwr9wcLH/wd1u27BBZm+S+nNkUlGf95a3wvnJXIdAydNXYwjCwO+mLRwy8Xr6gJ+ZPzzNrC1Ehx7t8VZGVUZooaOQKBQjqtK2VA/HDbkswcnUd4DnQYNadKjCcfgs+uCJoVnN86z7Ly5b0suueQVxcPB9GyKOHIqLA4Y1JLQ5bSBPTKOG2o1cmAoJwGplVQ6Iyd1UdTjGndQbgqa1XYlL+vaDm8eo1f7YDQoFEP6u91xdD9dHLFTABnMUlfw/RfqB8EVhzl6Ll1C7iszOXjOt62tMFoCmhp2Z9MM3jDALyNku37Nu4n0IOEGeG4o+aIbKPrdhtGSen0yeSHYpPLbUiY3YJCLJwOZBk3hffF9L5fNzS0WThibm0UERuGB4jvRDKGCZ1DVDBIlDuYSHberiMbTMxZiftfpDHQi+P8KtWTZqafINurL67yJsN8LJFES9abIDsOzUSwnCbgj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(376002)(366004)(136003)(346002)(396003)(451199021)(122000001)(38100700002)(2906002)(8936002)(8676002)(52536014)(5660300002)(33656002)(86362001)(38070700005)(55016003)(71200400001)(7696005)(478600001)(186003)(9686003)(6506007)(26005)(53546011)(83380400001)(41300700001)(66446008)(66556008)(66946007)(76116006)(64756008)(66476007)(6916009)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: Kx9dmg6tLn6bXro/kHB5ewCoKKjPOhuO6zyOsrjBMLKlbTFzsZhDDkXzgHWIQX8rfrl6osLj/B36FQcOX5BJkiSUIsNinma47n034PYXZzCwkFRrEyCKz8HiJJY8Dqvm22Ih2g0o1kQ49tZBHXS9isvpwqTaiuVnyoePljnsf1P4RCL+TZNr46Rx3niWQx9LcnMt+Atj1Ld7upFwBcd4AUNMe8hl9pURazydIB12GTzeE1XWw8qK4yYmFURdtBCDFwaGVr5MjSeTnqOwooDSPjlk+wQfMN+jq4ybWBKDBAsnPcSM1QatDCdniOPl6mt8HJFbo8NhmCKnL2jFjxBVHAidgXex6K/Sot2KgMFzB6+uu7KYE1d9chpnK9kTT46iNtDqUxe2i9Hm+kCeKE92GVHGUoM/AvKdF6+1F/W33Fbm8BoNicgXB+NG8uhKeeN5iIwZlyGt5a2illc8/aVygLvnUTTwHii+fG9RolsE5nobF20yPe6WsIkvDqxUemHFxQtK7QiwUzAXiMJiZfRM/KDU5CBJMdaWQv15MOpwSOo6J6GdzjO+vBFg7mLeQp3GeP7JL8DIgY1EYnZiBNzszAr0L9m6o4ClpQSaNgmZmWWPJ8kIwNOH4WdwIqmEU3RloXEQZoHqUtToEjfBKV+f6UKPYT+KW5d4IIyfYKs6CnI4ShHhErZIriBbyGgCgBEgMuvAoWhW1GLN65fNkss1/7DplrKIXtKWDsV4lR2nWNyH5rrPI07CpQ49YzMpHy/+RWm7Oq2m/P0dlCpDq1vlcvRYsxFyEUlHtG91IS22hBWCVYJ8sYE+OzRnp55B0ZcI8PYNbdXPkFH8WCfRSk6a0lOe1/Cf2o3CF3tHe6H+soRpZekNgBsV2DxaNK/042pVZBU8JX1V2f3I9fNfoZJc2d+oX8jOGdz2lQzFRmg7r8PVxm/Oom2TVJdB1CLnvdlH
 ze+aRDF+d1cXWkJGZ4eiHq8bHlmTnA7KfHPoYCylWn648ui+ineaPvtky8dbHqvoKFvRsrHbfkHWW1B7aMrvgiFxtXBYDxOXybLGHmsfNbNmhQkwjO8f9eLfdZ3ZiJx2CUyqpNDyoteugOq6iFhwclRwXDnI+Nbg6yA+i2iZHndQYaxkLElGCWAnlPkb2GOn7HAJjaju5svyLBVSxRzzMdHKMPWVOJ8f3pR+0+muxtXJfFtgdu37UXvW1dPp7Jp19y1vk8Yv/Yg6E08vQUgAmZV5BoJD6ODT1+6ehoVhDe12qh8rjKZaLX/51sOIRrhlnHVBm79uFZ3LOvdLPwCZIc3pD7lqLl4xLn9pZYdt1/sNh9wKthmmbB/2q+riGCgxXNtS4CDbyVkAqj0en7AvcWl/BkXYES4nGLy28TwIg9ItaC16aEI98n7DxLoF2N4SEM5Oaj9VqNMiAQ4F+4LRWzIUUPOdCWFx9Xidua7TsR4IU+Roguh1cCZ7puAkH9NzVBTv0HCEeATPV6EPnwsQ2bEGk759EjAOLqzhdsfSj7/kVBTM13+jfVj1mHnpSdNGO8CI207eND6e+vQDK1+l8W6IkfWJoc68a4sfjaWPBrhEaR15eqhbuPL7wU1+9y42
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2d1fbf-b47d-4257-24ee-08db4bdbe3c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 13:39:59.3724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GYVp/d4wId767FEIIMDOZisU0LZ27cM9IYh0oYVd/G9fHvvPCJLhS+oIrsa715+4j+Po3zEY/xkiB+pGUXYjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3423
Content-Type: text/plain; charset=utf-8
X-ALTERMIMEV2_out: done
Subject: [virtio-comment] RE: [PATCH] virtio-net: Fix virtio_net_hdr struct size when
 VIRTIO_NET_F_HASH_REPORT is negotiated.

Hello
It seems this proposal has not received feedback from virtio-net folks.
What should we do with it ?
Thanks

-----Original Message-----
From: Cyril Germond <cgermond@kalray.eu> 
Sent: Monday, November 21, 2022 10:03 AM
To: virtio-comment@lists.oasis-open.org
Cc: Cyril Germond <cgermond@kalray.eu>
Subject: [PATCH] virtio-net: Fix virtio_net_hdr struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.

Hard-coded references to the size of virtio_net_hdr strut are wrong when VIRTIO_NET_HASH_REPORT feature is negotiated.

Changelog:
v1->v2: Fixed wording syntax
v2->v3: Rebase

Signed-off-by: Cyril Germond <cgermond@kalray.eu>
---
 content.tex    | 10 ++++++----
 split-ring.tex |  3 ++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/content.tex b/content.tex
index 91ba76c..61bc09c 100644
--- a/content.tex
+++ b/content.tex
@@ -3622,8 +3622,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi  features are used, the maximum incoming packet  will be to 65550 bytes long (the maximum size of a  TCP or UDP packet, plus the 14 byte ethernet header), otherwise
-1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this, -making for 65562 or 1526 bytes.
+1514 bytes.  The struct virtio_net_hdr (the length of which depends on 
+VIRTIO_NET_F_HASH_REPORT feature negotiation) is prepended to this.
 
 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
 
@@ -3632,9 +3632,11 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
   \begin{itemize}
     \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, VIRTIO_NET_F_GUEST_UFO,
 	VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the driver SHOULD populate
-      the receive queue(s) with buffers of at least 65562 bytes.
+      the receive queue(s) with buffers of at least 65570 bytes
+      if VIRTIO_NET_F_HASH_REPORT is negotiated, 65562 bytes otherwise.
     \item Otherwise, the driver SHOULD populate the receive queue(s)
-      with buffers of at least 1526 bytes.
+      with buffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT
+      is negotiated, 1526 bytes otherwise.
   \end{itemize}
 \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at  least the size of the struct virtio_net_hdr.
diff --git a/split-ring.tex b/split-ring.tex index de94038..82e910f 100644
--- a/split-ring.tex
+++ b/split-ring.tex
@@ -127,7 +127,8 @@ \subsection{Legacy Interfaces: A Note on Virtqueue Endianness}\label{sec:Basic F
 
 \subsection{Message Framing}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Message Framing}  The framing of messages with descriptors is -independent of the contents of the buffers. For example, a network
+independent of the contents of the buffers. For example, if 
+VIRTIO_NET_F_HASH_REPORT has not been negotiated, a network
 transmit buffer consists of a 12 byte header followed by the network  packet. This could be most simply placed in the descriptor table as a
 12 byte output descriptor followed by a 1514 byte output descriptor,
--
2.25.1






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

