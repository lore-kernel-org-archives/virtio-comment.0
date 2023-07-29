Return-Path: <virtio-comment-return-6916-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D918C001DC
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:29:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9AB1C6126A
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:29:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F57F986853
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:29:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 86AC998683A; Sat, 29 Jul 2023 23:29:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7688698680A
	for <virtio-comment@lists.oasis-open.org>; Sat, 29 Jul 2023 23:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwnGMnFC38maF1Flc2aEJfJs35Kn3vUPLLazCmc4fkWRmUiLgeVQF51aPWuRVsdodKGi8nfg5XUgTLZv7IX6oyWtYh+xKlIqcpsX/LxquCPyq+B3GmA8fowFDqNUoo3h3Ec/ViQYq0g8Bfjj71afgI+rseETYcekfq13DsJyFBRiEVy82sAetAQoRsPIgdsNotTeN8Ood1KmgaCs2YTGAoQonFOV/LLxOC81BaJSpeofwot+zz4hyg5h2DnKqdclAfpH/3OgJ6VsN57SPp4LD4heLNlz5QIUGNSZecow4kXoxOiJpHeCw8SMtTXm47wxOq44zNuhqZDhrCJ5zZ5KXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKy7DdONRt4JL3pgRhuO3iEcRNNlGFmBJJrPs0anQsg=;
 b=aeiLFMWVozZYCeQ6pwHLB3rDFd23TIBTFjfvnzcuyEY+u30Be57t/8SYbUQtUZIWwk2Goxi6rvXaPJHBlsZApDyAoUnNpe0uWYVNWhe/mcuj6vZF2xhLj16c5UdAVcilBjH6uxzkryaE+MA6SpwwBqNZv8NcpwKpMX2tRUqzmS2pDLSlcsFCl+zGsKYKrsDv+i4U86Dt5bTnP02/0GW0spjfZjh00PFDpplSmwJ8XVA0CTDRZcxyzB8U89vwWNP3wZEWlRicUE78Tdr4ew6dfNTfwCiiD8+uzunFL91gVNY9c7t3vKF52vMVJp0dDqfD8eVYL3/ZdHe9oa+4mG5phw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: zhenwei pi <pizhenwei@bytedance.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>,
        "parav@nvidia.com"
	<parav@nvidia.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
        "houp@yusur.tech" <houp@yusur.tech>,
        "helei.sig11@bytedance.com"
	<helei.sig11@bytedance.com>,
        "zhouhuaping.san@bytedance.com"
	<zhouhuaping.san@bytedance.com>,
        "xinhao.kong@duke.edu"
	<xinhao.kong@duke.edu>
Thread-Topic: [virtio-comment] [PATCH v4 6/7] transport-fabrics: add device
 initialization
Thread-Index: AQHZwnSDiGmkgyh9bUizjCYaAXoyvQ==
Date: Sat, 29 Jul 2023 23:29:26 +0000
Message-ID: <4D8A0B9F-B3BD-433D-9B69-E45059C4928A@nutanix.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-7-pizhenwei@bytedance.com>
In-Reply-To: <20230626072551.1709389-7-pizhenwei@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|SJ0PR02MB7280:EE_
x-ms-office365-filtering-correlation-id: 5b959fbf-415d-4420-4a55-08db908ba64a
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hWAzHEx224+6VGKZSs94L9fUp1itl9w6tA2cxGpa+bd7tpDPgNW5rAuttxsUCRkHMzqF+KJFroOtgkLEUAJQB53kRxA/JAn2eoSxx4kY4S1UIJ480moSvUFBnDHYUzCfqtKcUUdDKjNhfWUENcpCuW9dlKj6nXsAl3J57JH88eILHgRwsSJLYVftWCHMoQM6mG7XJSJAC2WsBC3HoaN7sSAH1971C8PEC9ESfNu1xvBjpnLMxQZzmhFjBXqTB+ayrTrqlDRE6yAefyc83Ltsz6abaTd2p7a0S6h+cWnuNG4QQQP9tn5m5KY6aD6FAQpOWpqZ1L//jlM4QceM2/kutdu97OKcc8w92ftquBQDCcdfrgpnLnV9u8GntYM7XLaBk4KFoXgPJcjMeN0jj9+TLokUt2udJT24eVm7zSIfwvhm7B75sCzrAJyj6Ioi4rsPakmgF2bmtkMXk6x6aJFvkB1WonzOa4cSmMR1k72mjvs/0r3MYohpqG1ZYznFqbVzae709sjnJbxcQH6++w1fectgrHRAL7tkwmnevTJRfVh77jt9S3x1JR8McSbpcTgrJvXebujsoEK6r/u+hC4RHpvwmDcZ104Z6U6tC3hAJmJ9AaHlWVHZhnwYdRIuL2ocG9eBUD0YJuOgerMe/o2x7A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR02MB7938.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(66899021)(316002)(2906002)(8676002)(8936002)(7416002)(5660300002)(38070700005)(41300700001)(44832011)(33656002)(36756003)(86362001)(6486002)(71200400001)(122000001)(54906003)(966005)(6506007)(478600001)(26005)(53546011)(186003)(76116006)(66946007)(66556008)(83380400001)(38100700002)(6512007)(66476007)(64756008)(66446008)(4326008)(2616005)(6916009)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?T8dwSuzLmRIBt4+XocsPclGbOiZx4TPoGANjWBumC7FIdytOdHSmBYYYb/sU?=
 =?us-ascii?Q?v3Nm2soa1iQtJ6E6oaDJVtBnTY9dMShX0upY95spDTXMnzYyl5rjCN/96JoG?=
 =?us-ascii?Q?P6nSJD4BZA+7bb9KGzOrUrW/2ZP7VjFpfSW53+u81IAPqxf290hZ6HX43Hd2?=
 =?us-ascii?Q?DdlZWZbYOt8WK4IXrdtukzDmOXkhF2pe871Mpo0givnHfTc3b3Hk6ajC8fml?=
 =?us-ascii?Q?utcY6JNil6tF858gCwvwdDdc0nq0wQGYzs31yaY/dZ3/2bbs6oPCi7jVGaCo?=
 =?us-ascii?Q?4/LW+Val3V8UAOCBHX01kfxf72kpDwwQtvLjzFzyxRMpIq31FTxGODpcVQpE?=
 =?us-ascii?Q?c/g19askJFPbd/txyNZazQ/cnrjDn07Pr/JFfOfg4PDDltNkdQ7/Dst3/gyZ?=
 =?us-ascii?Q?6vYXY9Rl2/EOnbmgEtlU5tVQ6TB6/vUoSjraWAl9iIFgFBKxAOgqVW+t8kOw?=
 =?us-ascii?Q?PHOngMfA1Lkn3GRZi2FToJrAl91DQdkYpA/+oV8GCDBs235VMxux1hIua0KQ?=
 =?us-ascii?Q?1rjlm+tqqm+ChKM+/yl61iCVKW5xZM4POrfOT9FfJ4CLSMAumgur8YJ3ASTb?=
 =?us-ascii?Q?hlQMq0qPjiic1O9yaJeALy6qOtImHcyX2/ISxUNr45iAMC1WaVBsUn+PwaUj?=
 =?us-ascii?Q?qax51+FI1/xne6umRuYPxWBdsmDcnfiekszUNUOCNcARuZvE/wfJhg68U5/9?=
 =?us-ascii?Q?UizW4K9SdiBVq5dIhHiLFWn3nFlV4okWKR53sLvstvBRccgxCKcN0nZLJ91T?=
 =?us-ascii?Q?ynNNpAWQteW6eoCMq/18KGiMBMfKrIKT6PjrU3MwXOcXj+u4m8YtGWn+sBqU?=
 =?us-ascii?Q?i5bTkQJSOitpO4OkheDONsHHFB25FfDAmR/u9MEt+9+dTZK2cw28Wn5+ZH3u?=
 =?us-ascii?Q?y3XFUAwOZjMV81QRql/gEfHo9V5YUQcb8EAQOEO2hhtndZAb3e/LDZk3XDmn?=
 =?us-ascii?Q?LnTF2Y1l1iG5JwWkmFmIIM956+oFx99qjLNSi0MIq+ho3LDu3aKq+Q6t2FUZ?=
 =?us-ascii?Q?Yr0DnRtAgxcil2ybYH3yvSDEWgAOlE9Boo4ALjMa3nGLI8I/y+DRQYgrDVHf?=
 =?us-ascii?Q?sK2VAFlIRvL/2wQ+0fmwHNNLfMTE9rp56Qb3Cn1qatLC+laBSv2Y0SCGVt64?=
 =?us-ascii?Q?LQsU9qJyUT94sVR4Rvu6aq+n3u/+OY1Lwx3JL3aDaNTbZzziawjAJEstJO9Z?=
 =?us-ascii?Q?LbVyv/UB0PntPusdXTlPhaJRn6mGD+GG84qNuVByjDlXQkYu2eSGaMWthuTV?=
 =?us-ascii?Q?UhSpn8HL8wALVhjkc0Su/ucWx8b5TsQZS26U7srxIhlfSXzRw+jrfI154rZ7?=
 =?us-ascii?Q?iU5Vz9e3Qp8rz2/xL9Gri9vSYyTwhw6uuMrHjjLboo4nagygzfj1MNDGEMue?=
 =?us-ascii?Q?4LcKvqaH8MhRPwSRIvDCmvuQb9ck3Dl9ao9U1HILBOe9JBjTDTCD6YjNGBJy?=
 =?us-ascii?Q?udBHk80loJ0crFFTSImj2PNnPXkdYgGCwgkSUnde0q2Jnfn403f8+c1F2wVs?=
 =?us-ascii?Q?xZX+GTddQVsuD32tuXbl/1F5Md9K8jjWq+gjV9qa18qGQP5tlsYahIpG1rXG?=
 =?us-ascii?Q?4RywjTShLKyZpEPtMuLPucrw3Ek5gCwKtGO55ErliPxKciwUG9NgASp4v6uk?=
 =?us-ascii?Q?zA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FB0E7332A060ED438D76F006E75924F8@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b959fbf-415d-4420-4a55-08db908ba64a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2023 23:29:26.7661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cyFVqYqto0zq636BkUekekUcnNe69xu5wXifriIC3LafaNLW2yGavk2wr1Uzszl5nIkcuTC23cs0HSja7PmETWSpanp0SJHzO/jjPqjrOU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7280
X-Proofpoint-GUID: YMjVvgs_4V4tPjR96bkbOOcm9whvYkFN
X-Proofpoint-ORIG-GUID: YMjVvgs_4V4tPjR96bkbOOcm9whvYkFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Reason: safe
Subject: Re: [virtio-comment] [PATCH v4 6/7] transport-fabrics: add device
 initialization



> On Jun 26, 2023, at 3:25 AM, zhenwei pi <pizhenwei@bytedance.com> wrote:
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
> transport-fabrics.tex | 33 +++++++++++++++++++++++++++++++++
> 1 file changed, 33 insertions(+)
>=20
> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> index 75e4855..f7f29cf 100644
> --- a/transport-fabrics.tex
> +++ b/transport-fabrics.tex
> @@ -755,3 +755,36 @@ \subsubsection{RDMA}\label{sec:Virtio Transport Opti=
ons / Virtio Over Fabrics /
> \item The Virtio-oF target writes the remote data by RDMA WRITE.
> \item The Virtio-oF target sends a PDU by RDMA SEND.
> \end{itemize}
> +
> +
> +\subsection{Device Initialization}\label{sec:Virtio Transport Options / =
Virtio Over Fabrics / Device Initialization}
> +\begin{enumerate}
> +\item The Virtio-oF control queue must be established first by connectin=
g
> +from the Virtio-oF initiator to the Virtio-oF target and issuing a
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Connect Command}
> +to create a Virtio-oF device instance.
> +\item Optionally, The Virtio-oF initiator issues a
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Get Feature Command}
> +to discover the features offered by the Virtio-oF device instance.
> +After feature negotiation, the Virtio-oF initiator also issues a
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Set Feature Command}
> +to finalize features.
> +\item The Virtio-oF initiator issues a
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Get Device ID Command}
> +and
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Get Vendor ID Command}
> +for virtio driver.
> +\item During virtio device initialization, the Virtio-oF initiator issue=
s a
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Get Status Command}
> +and
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Set Status Command}.
> +\item Optionally, The Virtio-oF initiator issues a
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Get VQ Size Command}
> +to get the size of a Virtio-oF virtqueue.

This may be a good place to add a Get/Set request max scatter gather length=
?

> +\item The Virtio-oF initiator issues a
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Connect Command}
> +to establish a Virtio-oF virtqueue.
> +\item The Virtio-oF initiator creates Virtio-oF virtqueues one by one, t=
hen issues a
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / VQ Command}
> +to supply virtqueue buffers to the Virtio-oF device instance on Virtio-o=
F virtqueues.
> +\end{enumerate}
> --=20
> 2.25.1
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>=20
>=20


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

