Return-Path: <virtio-comment-return-5724-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17F6C77B7F
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 16:06:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 006C5126C2B
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 16:06:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD7819866AE
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 16:06:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C8BFB98658B; Wed,  3 May 2023 16:06:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7C58986594
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 May 2023 16:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Virus-Scanned: E-securemail
Secumail-id: <5f2f.6452868e.ba099.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHwKTQR241gHVed5OVpSEum1Yjag0W1vKizyXM71xhOC5VxGKpfc2gyAIU67RWtHgTI1n5DUsW56ds2gfl/mP5jTnwg0rMA50YhT1hMYCJB5PKV66PHfa9oLhaaJpGvQF8jsognbnjQmf0k77LUGRSwn+JVDoAfYKrRXHVE4ofIKqR0LjTnx5qcpKf3O6XvoVx4kIUAJxXUZTJ+iyT15E4TUb7autC27AkNRl281FiOIozRmnWFcrVNpZZg7qEppTLvWE/CvN/+yJKCX/oXjmgwSmTFh7VfiPLLTbp5TMit+IHez1Spnj+USHqBgw6NWOGEC8M4LeTvwhRvWLg9nCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4y7RKGtgFzfnlOjfln395dAxRXhZMLcrZJKhPyvdo1U=;
 b=RoITzJ/0WOyVgZ8LQQqMYkge51AgvQ7Y+0SGdWukF5zEUSaNDj671WzoIbSzCMmcEGgksoR/obQ2bRFFF5H+E7RuAHRsjiVApl2wpJ39V8yPc11VKl70xH9+SkCLL+86kUyRY90v9fLhk6OHaP4xgzLN6KleYoVLcm9PRun9smjsVglIk9IpW7pxXl1lMtFm5uedfa5qWo1eh4vr3kUqDnCktzwdBKdyrJV343YJnaQE4Tjv9OKE5M+PD9Nvb5BNWfRJUL081n9uQMhSLxGuqLVIjfSQHFG7/IpecUkVClXE1elUAfmUYUbd2KQrRmew35f3j5sUDP1MyrAHOTmbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
From: Cyril Germond <cgermond@kalrayinc.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: virtio-comment@lists.oasis-open.org
Thread-Topic: [virtio-comment] RE: [PATCH] virtio-net: Fix virtio_net_hdr
 struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.
Thread-Index: AQHZUBws9xErIboLTkuPTmBRBa1so69I6OJwgAANlgCAABtbUA==
Date: Wed, 3 May 2023 16:06:36 +0000
Message-ID: <PAZP264MB388803A394E65A266E2D587EC66C9@PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM>
References: <20221121090212.645-1-cgermond@kalray.eu>
 <PAZP264MB3888A224F87ABA76501F3CC8C66C9@PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM>
 <20230503102517-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230503102517-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-gb
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3888:EE_|MR1P264MB1603:EE_
x-ms-office365-filtering-correlation-id: 8f9cef89-9034-4ff3-9ee7-08db4bf05f23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2USs4e0MOxOV7/CCVT+DKyNajbHUEITyRlah5Q58Y5zA/G8wc23Zs7D8Id5lM3HalY/MkNmViN69btFvMOqLfwvR7l1/HI/ksFLG8+VtJRMNfEcD2ytSY33xlNG6O51LSW5i6KSICZ8YKP5ip2s4Ypi80eU5br/t6zdMvHfImAK9QH07tHYbsz7IV1x4ntfuz63+THage2xLZOt/VrAVBgxXubosxv4NkhaYu3pZceqj7rGrxdaLz5xtRgKjWt9zMyAeD+qdbQDpJE/teO/nbVRIORJIs3qg/qTWmRjXxRIeITGjLHA2GC8hrjP/YHHLQJHbf59IVKEffwvjaeEqsRg68o6Ur+XsnH8NNPeyqhNtIir57W3jWJ0r3RiNavAq3d/oOHGc/377rZuNPCiBREDkDSWPsfJYCgJaxD+WwUu5vw35nia1jhjiYR8+jMuIE0HzRErdDzXPKrMpTL3pR+vMNNEgBsqxkGi6YNblQmbaGmN56qSGbLrURxqP9t4LHQTpIpIpGmsLWzGmGXslKDZk/FkVu8/L+bj6DeZNN+pi0h0ARBs7ZrzWEZmWKaCGmJed+YshyP8sieDWFGdh7nXGScmjc6AfF2K6ApBMaE4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39850400004)(136003)(346002)(366004)(451199021)(66899021)(33656002)(122000001)(5660300002)(2906002)(52536014)(38100700002)(38070700005)(316002)(86362001)(55016003)(66446008)(64756008)(66476007)(66556008)(66946007)(41300700001)(8676002)(8936002)(4326008)(6916009)(966005)(83380400001)(76116006)(26005)(9686003)(6506007)(53546011)(478600001)(7696005)(71200400001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: MoYCypsRI/CYcy+BboYxwnAUL3b0HKOC9xriwRWdutCn5T7YFgpHwtZKPZW0DOSqdGpU25LVZw/vBFjtc8fCxn1Ghc5l8Rq705J2xlAleLYhcrtaJsKaRlClqYW9nEDc5PlDBTFd5QIcvFVbgxH/LBr0w6vTACjdseQ98uOZC72mdpoXH0UyjSu39UtFKVod5lnMFA7ORNfH9x9nlFDbHTByVa24QYkVLK7vZpogPB9dLgrnrDAoQ2xcBY1OeI+6xKbJMDoF/2F7HiabTWbwQWTjdpCkKoM0nQ+TbNDxsfqv4g5GJexBkyE0g19bmdWCGjS7EU6AJHureKebhqL2r1SOTN3jXpwE5QxLXVCMjFZQXbz9Ik5k3okwdGnV2sNJXnlDQ6oUDz/eqjKZotWpVe/4XQ3v36omEYNm21hGgp8ukIUmz4Cqc2/sDzrQREdzClThnxZa3/9y7XIieC809pdY5ODT+gEeMjWE/80MgPGCPAltYkQCM8ql3Pua+kwTntj/q4id7gzdxqrGlAescIEi6EGiVmjm6oB+gEHto//AobOqmAu+KOOgYeoNBWiewQUGUK55+neqbO0ZTAfJgdjnjQg4sS2y5/0TWcn9x6Eo9MEYiPB7gYVz3a61pl7uLSOep2lLy1m8xo8IbSi7z/4oB4WK6IHiu+QNg+/RQh+sZS76PVXQwRNqMVhlftvov0/so6cRQZXoJHczRCNsVrwd1zgJoRCLv1zgyTSqhzqgga/wGIYruQxK/t/SqH5ZtBnm0d7AFFQ/e3IDHwcUvTwoQk6UjxnJTskHAcWoKVrwqQjcw+qvbwIPiPC1LTlg+84JEgenaxEuwAfY+/tiz7xK2HW3c+HSSfLI/zEWkMIzlRPY+fg6LGJ7cJxaD+N65JjQO6gEtul6uqFbUg2kW4wcWjd059hq8uNmYApdtwjLUnMZxvWUKf47z5VL2Bqo
 YO9TbwoeUIf9x5wtTCK8j87gS5x1SvHBN/RJiepEmGknrPBrZ/xe8jPIWrFuS0MbJNejTHvXr7dqQ9tVkaSXeGClu4YtqgAfreavPJItimk3YSt+YG6Wq0IqtjRhMumuLp4tImL4pRuUXbEQcBUse+p8XKmJbe+LK2fcX7tXPuGUpo8Nf6Qn7R1eAmlVesJ7orrYZ50NzdVY1gB4otBdfZiHQY5x96XDeFzQYr4ULUNcJVFvmiMM9lQWJXsqRApna4670nGgjB73aM6y7pGOyVZ4aXSJoWGTMygfat1arqhBo6goQrDsI90wLo4R9RQomsXAl12sz+EoiVRkqebzHVaCRXY6IgOZR6fu63WmntD613+eC8WJZHkaKLSHMNpavonr454xR6xFCl8WcwgU7LX6vFwuVWhLNkVZ0d1V+qIpnGSavTX5G7RbuNnxlZe5Thlj3JcyxavAVDKx+W1mdU93y1W7qllAqcUoVXaH+QMNIdvBH8fi0+Gn53XxyogM/tE3ekc81G02JfFYfoyqQa3xKNsL5KO0Y6VTyLLMre/baV4Aah9cghhpd6apqURQcnqCSgO46TAnzP0LA1lJeP6TtB92NOm/I060clDCCQXhxteNiMzOnj3i7jTtNu2f
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9cef89-9034-4ff3-9ee7-08db4bf05f23
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 16:06:36.2846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ToW1+lWM4j+7k65D76nyxbTQG4GMZ1KVt0AyZOhwLrF3GQY104W11vvS5nQfPsK5dUlzLLBSNkraWxwOQHEUWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1603
X-ALTERMIMEV2_out: done
Subject: RE: [virtio-comment] RE: [PATCH] virtio-net: Fix virtio_net_hdr
 struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.

OK thanks

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/170

-----Original Message-----
From: Michael S. Tsirkin <mst@redhat.com> 
Sent: Wednesday, May 3, 2023 4:27 PM
To: Cyril Germond <cgermond@kalrayinc.com>
Cc: virtio-comment@lists.oasis-open.org
Subject: Re: [virtio-comment] RE: [PATCH] virtio-net: Fix virtio_net_hdr struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.

On Wed, May 03, 2023 at 01:39:59PM +0000, Cyril Germond wrote:
> Hello
> It seems this proposal has not received feedback from virtio-net folks.
> What should we do with it ?
> Thanks

Request a vote to resolve this as described at:
https://github.com/oasis-tcs/virtio-spec#use-of-github-issues

> -----Original Message-----
> From: Cyril Germond <cgermond@kalray.eu>
> Sent: Monday, November 21, 2022 10:03 AM
> To: virtio-comment@lists.oasis-open.org
> Cc: Cyril Germond <cgermond@kalray.eu>
> Subject: [PATCH] virtio-net: Fix virtio_net_hdr struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.
> 
> Hard-coded references to the size of virtio_net_hdr strut are wrong when VIRTIO_NET_HASH_REPORT feature is negotiated.
> 
> Changelog:
> v1->v2: Fixed wording syntax
> v2->v3: Rebase
> 
> Signed-off-by: Cyril Germond <cgermond@kalray.eu>
> ---
>  content.tex    | 10 ++++++----
>  split-ring.tex |  3 ++-
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/content.tex b/content.tex index 91ba76c..61bc09c 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -3622,8 +3622,8 @@ \subsubsection{Setting Up Receive 
> Buffers}\label{sec:Device Types / Network Devi  features are used, the 
> maximum incoming packet  will be to 65550 bytes long (the maximum size 
> of a  TCP or UDP packet, plus the 14 byte ethernet header), otherwise
> -1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this, -making for 65562 or 1526 bytes.
> +1514 bytes.  The struct virtio_net_hdr (the length of which depends 
> +on VIRTIO_NET_F_HASH_REPORT feature negotiation) is prepended to this.
>  
>  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types 
> / Network Device / Device Operation / Setting Up Receive Buffers}
>  
> @@ -3632,9 +3632,11 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>    \begin{itemize}
>      \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, VIRTIO_NET_F_GUEST_UFO,
>  	VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the driver SHOULD populate
> -      the receive queue(s) with buffers of at least 65562 bytes.
> +      the receive queue(s) with buffers of at least 65570 bytes
> +      if VIRTIO_NET_F_HASH_REPORT is negotiated, 65562 bytes otherwise.
>      \item Otherwise, the driver SHOULD populate the receive queue(s)
> -      with buffers of at least 1526 bytes.
> +      with buffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT
> +      is negotiated, 1526 bytes otherwise.
>    \end{itemize}
>  \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at  least the size of the struct virtio_net_hdr.
> diff --git a/split-ring.tex b/split-ring.tex index de94038..82e910f 
> 100644
> --- a/split-ring.tex
> +++ b/split-ring.tex
> @@ -127,7 +127,8 @@ \subsection{Legacy Interfaces: A Note on Virtqueue 
> Endianness}\label{sec:Basic F
>  
>  \subsection{Message Framing}\label{sec:Basic Facilities of a Virtio 
> Device / Virtqueues / Message Framing}  The framing of messages with 
> descriptors is -independent of the contents of the buffers. For 
> example, a network
> +independent of the contents of the buffers. For example, if 
> +VIRTIO_NET_F_HASH_REPORT has not been negotiated, a network
>  transmit buffer consists of a 12 byte header followed by the network  
> packet. This could be most simply placed in the descriptor table as a
>  12 byte output descriptor followed by a 1514 byte output descriptor,
> --
> 2.25.1
> 
> 
> 
> 
> 
> 
> This publicly archived list offers a means to provide input to the 
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and to 
> minimize spam in the list archive, subscription is required before 
> posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: 
> https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: 
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/










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

