Return-Path: <virtio-comment-return-8779-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DA2C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Dec 2023 06:23:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ABE8DEEA14
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Dec 2023 06:23:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 80D54986591
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Dec 2023 06:23:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 61AD3983FE6; Tue, 12 Dec 2023 06:23:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A945986556
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Dec 2023 06:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nja/na6MV7SMUXnKgHq74+jobyn4Ejkk/saLacBbb1QVdBG+kQjGkIzIvpap9YGE0QpB6eFk9eKgWxGyQTEtMZhfDmLBBMHchGPWb51QScDttArkPAdBx1IYQbewyX56+bbHluT8kzedGncY+H2c2Rmd3BrbtquqSXVW7IWx6YZDfzNpkRIfLG78M/K4Q4FfmQdxelvVs/RfGho++V9rVF8BMcauhJc8ztCgAoqubj9HUJP0UTFuNTi3+JjL+ZCZKcPzwhqOT01VQ86h4Ovu5aWVkD27CEoOkhAtV/Ns4BXbRv6++tFYI5v94KWS8wsQCARytWxYs16w1qbqSNv67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAHqGY6lO7bAnvaMevItyfr+bwPKqiHDaN8B5/qv+iI=;
 b=QmUzF6T3eCPqq3ppGxdM8Rom+V93RPPeuwvzFC+J0IOiriXSwqucvBFs6KuUCWur6nxdzXjvx9LYnHeJ/2lQM4G798fS4KNEFZlbtgZCaGwKc3A+0bzSouXpfGvzQqWYscsbMKMDsqXAkn4BJshpi5oQuLlD+bSt3n5SWMGb5DDDIDNOLKq37XEqqR2pGwSaewRdEXxb04Srup12YWX4172+8ND1U6oi9ZcUQp+glHyPrKdvWeO/5wrOMd4meoCTiX6VuXrtp59AS3Tzp6OXBJrmBFz9E7VzaNltKppWzT0GciFUytYMBefoeLBYwtLnSZsGnHGZmx46AZUDZV4Bsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: zhenwei pi <pizhenwei@bytedance.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
        "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
        "mst@redhat.com" <mst@redhat.com>,
        "parav@nvidia.com" <parav@nvidia.com>,
        "houp@yusur.tech" <houp@yusur.tech>,
        "zhouhuaping.san@bytedance.com"
	<zhouhuaping.san@bytedance.com>,
        "xinhao.kong@duke.edu"
	<xinhao.kong@duke.edu>
Thread-Topic: [PATCH v5 0/7] Introduce Virtio Over Fabrics
Thread-Index: AQHaBZ7imotTmbTs4kCv51YD7NZAtLB+BReAgCd2+gA=
Date: Tue, 12 Dec 2023 06:23:01 +0000
Message-ID: <527CF341-5AB7-40EB-8A58-722672301B27@nutanix.com>
References: <20231023104647.290759-1-pizhenwei@bytedance.com>
 <2e46e50d-62b2-41f7-82e0-66b3ecf71bae@bytedance.com>
In-Reply-To: <2e46e50d-62b2-41f7-82e0-66b3ecf71bae@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|DM6PR02MB7065:EE_
x-ms-office365-filtering-correlation-id: 8531f240-f3cf-4c5d-6557-08dbfadacad5
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nMZg2yVMStCp4/E59zYy9QYsawDWs8agYvkVd6A7m5scV/oRFypsAoKJfWliz4e+Ud4R1Tg7jeFq68sjUhPQN1cv3rh/xt2E56ooVL2rL2cc7CQExbUl3mvEySSyDdIQwcCvFV/4tGqcmnAp3Q+fUtdU8EilNjbZcFJ4F+htShuWizqZPPHDABnnFsGjKVDSZZat7pVVXNHnFwHa2iytpjKb9n3/3w8TSXNXzQMlAtiyNS6v8KlVUO0KkSGZtFRTtwG46Mql9lf1QR0M2wtC98f/8Nl9gUeOcRqzqG5OPcK6ir5apvDX2S+qIBWxUk66Q4jmLSaGxiKKcURWH5p3eMScGU/MdYQYGFaEn3GRYLuxREX3pZoHRzYNr59gWmfUKoIZG+KmJ4StlrT50dHpLvrTy1IKPaJx/+tU6/XK/c9OGdN1gLlRXHKaSK6iEtuwFPt6hHIvapJCy1INrzFc4vd36ir9QJ4qT1cOp4eb/KorqpABvncLdpSNdpbETNS77XMKPP7vamv++yBq0Bip86og6zOXUx+Cr4LGR6WYiccDjhG+jYkjcmes7If+jOjaM+DFavezZ6MnSPP92tFo2eiNuFoYdETdeQVMeQsXqnWI/6ilFmOuAzg6ImrxI0VX5DI/PMvs6I+6hdbUZMdFBg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR02MB7938.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(4744005)(6512007)(2906002)(4326008)(6506007)(26005)(53546011)(5660300002)(2616005)(44832011)(83380400001)(8676002)(38100700002)(122000001)(41300700001)(38070700009)(76116006)(91956017)(66476007)(33656002)(66946007)(6916009)(66556008)(66446008)(64756008)(36756003)(54906003)(478600001)(6486002)(86362001)(8936002)(71200400001)(316002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KVixLJoag+B0jjqLId6svVw09DEJS48R940jIwrWDEJcVp/yW5+WUIyLSMMW?=
 =?us-ascii?Q?EaGymbASyUgFnjb0F5epD3/EfaEcK+IEkt+Ruyv0L2+Vdw0b5J3B2lg+HdDD?=
 =?us-ascii?Q?1Cewbq2e4lGuEx5WfsVbwiMIdvqrJLpnVzCdIlBRc4NzBVbivwJWhfQq8CW+?=
 =?us-ascii?Q?nd9HaJHIR4rN7My/yLj9r2WxXvqw46WDFIc2koye3EfiLQFip03mSR6DeAsx?=
 =?us-ascii?Q?nhlXDpPbT0dDHg0a2+KILqg0c9retYQmD00E/OX539YjmVxvqZu+sy0QFlkH?=
 =?us-ascii?Q?XwD6+evWGF2UsbJqdH/FABXTCx7Riqe9UmPkK/5KRszHW1otu5LoEukS+2YE?=
 =?us-ascii?Q?Rv9GeSKGOO1qfxh/+uUG8oUQuAR3pyl2X7bcynWZMDsn47TiyEwiSYfeCCqe?=
 =?us-ascii?Q?MSBcXaHmJSyySB3ldLj09BuMcZuHhtUD8E9HLbz/t8tgyDpb6SFhEEcDEK0S?=
 =?us-ascii?Q?k8aTKz+GiuT4JZU/UnYvEJyqLwRL/Z/bO6NmhPTdjPSpaKSqhJZR/laOCONV?=
 =?us-ascii?Q?AB3gdQwARCJO2+NzU9g8p7oFd3OUb6pr3/GNRGz+TndmQEHEXRo26moYMV+z?=
 =?us-ascii?Q?mWQSWl4KorlZO1m7GcsIgCPSKyBsupg5LkLdn5D11mkSQmIwjwHrLFY9KaYB?=
 =?us-ascii?Q?SjvpxyO7vA/8Z864yaJld/F9zwtBt6efoOc9ixrw9QibAvanQ88mlzOgUIkV?=
 =?us-ascii?Q?m4JGRIiZFdjmPo+La05sSNP/HLuWBrDo6QAODOuofcwfZjfncwXhf//le3YU?=
 =?us-ascii?Q?zdpaFFuBaouTrxtZ5jol34WvN9JT/ouWu0hm3Hnuj77iz4U0QK7vKFdZO/bI?=
 =?us-ascii?Q?XzGJm4ZqWOgOlaQxZGprsAoeDG67jNbiMLRbmYGuP5hT4paz/p0zbpj1TrTe?=
 =?us-ascii?Q?sqUrbjf7kthI6VsunFeTAjzzH8qx+MKfRBQU5pc2A9q/h7rb70poh3f41SOU?=
 =?us-ascii?Q?GwimN+YUY87em/tZ+vkzYqbVdh1Mi4qnOvPHMxFrBhVHaoTLqMEyGxo/LIRH?=
 =?us-ascii?Q?UgrdwQmFrkE9cU38Ua2GHiUe3FDIl7Ww8AoGSw9VHL/BDLY8qrJW2nkcMPS7?=
 =?us-ascii?Q?8we8O5+JaNI0KC+pDI/3vO2njVM6pqzb4DLfxqSZYCtSSRqSZuN7eO2BiobL?=
 =?us-ascii?Q?5zpwtmgJLZxzvo/xmNz7zImKX/imHJjtoUMLtgdhMxaZczYijoLyfW74jpUO?=
 =?us-ascii?Q?ZzoFKXoFG04WQCV+GuEF4fSXh97XKUV1a9xezqIlWfYaKmAMxxHqu6WjwmTb?=
 =?us-ascii?Q?4OQbgV13gVDmAK6CZVBOFq7VF04QaDNLjbqQP7tIRmJB8CWMHgB/oYpQ7HvP?=
 =?us-ascii?Q?o1h051h31oTJIhSlYML0iFBIBmf+5PqIC+g2z4HDAp6l5/63710njMlNMKVz?=
 =?us-ascii?Q?x9YDjmt/wWBBqZGTfuYLT5hCnC+pDOR4Z4D7X3HjKDXor3IjB+i9S7LIcIeH?=
 =?us-ascii?Q?aXbedMqLzrnRxj1BlR82KBPlTuUcvaT8ngtZmT6IUXB0GkMyD2L+Hcx9vgyw?=
 =?us-ascii?Q?HVpGByn4ZbVLZYCidYkyj+5ppSwR07kEtD6hlKTScNNgyJ1kO9CjGoS3huzI?=
 =?us-ascii?Q?mUpqvTiIjNN8TLA5RCjhBY6/Ilh4GV+jM1Bn8D2jv5ajx++Jfn1mBlYQ1TIF?=
 =?us-ascii?Q?Xg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <55E0C7C2F3BD1341ACCCCA865FB66824@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8531f240-f3cf-4c5d-6557-08dbfadacad5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 06:23:01.5494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hU1ayRMMRR8aXHjOKDOkQQDQXCgn+ETyASQUIqTpXXNV9bMF5074nLxrt1ccswKYGfGOAs5y93Utmc1VL/Yvn17dKzUWsEhnCknTsEaYd7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7065
X-Proofpoint-ORIG-GUID: A4mAyRfeaUvC016PybftdtVvUANBa3Dy
X-Proofpoint-GUID: A4mAyRfeaUvC016PybftdtVvUANBa3Dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_27,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Reason: safe
Subject: [virtio-comment] Re: [PATCH v5 0/7] Introduce Virtio Over Fabrics



> On Nov 16, 2023, at 10:43 PM, zhenwei pi <pizhenwei@bytedance.com> wrote:
>=20
> Hi Stefan & Raphael,
>=20
<snip>
>=20
> There is limitation for multi-path, because one TCP or RDMA connection pe=
r VQ in current version. what about adding a new concept --- path?
> A virtio-of device instance has one or more virtio-of path, a virtio-of p=
ath contains a control queue and several VQ.

Apologies for the late reply here.

Sounds reasonable to me. I had wondered why you had put one connection per =
virtio-of VQ as a fundamental limitation in the first place.=

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

