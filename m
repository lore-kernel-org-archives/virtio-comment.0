Return-Path: <virtio-comment-return-6883-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1526C001DE
	for <virtio-comment@archiver.kernel.org>; Sun, 23 Jul 2023 21:39:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4A7672A887
	for <virtio-comment@archiver.kernel.org>; Sun, 23 Jul 2023 21:39:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3974998639E
	for <virtio-comment@archiver.kernel.org>; Sun, 23 Jul 2023 21:39:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1E829983E46; Sun, 23 Jul 2023 21:39:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0ACD098634E;
	Sun, 23 Jul 2023 21:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gq2Q/j5Iu4BFejaBxkHBRjlPW7YJoH2bnWNaOvhWzhVLbepskl1kkV9cAxoHQG7C1/iOgcm0L+4S2AsnIyN8aq0IWT/+IODCDnvIIblrP+9z83Q229iYUKwupTBTsVVjsFaseK1eGF1nEcUui1VeFXRm1pURLurPjhF6fhqCfVrzhJq9RV3ylJBNtkJ5/yqjpoY3tJeHuFHQcag8Q1ylWrlF+1hkko5ArgZkIL1vVzA7ObW8iHhmefCgBD8tSnrIakhEiYQpaTgAoDm0Unvwv/MpFJcp0oXS/Z1UH7X0bjn/FFedaB2VTqgWHK1CJEgW3UUGvxsozphJFiJ6gBfY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnElhY1dWXSxQtI312Qra4P2EHuahJySGv1UGye1XaQ=;
 b=fA3rbCmAKdhVNVphSF1g04yf8zbHDbBkAK2EGW2RlRUrmKEQO5pZ5rZbamM3J3toFmsi0g2FgnRpZByn4uTuG6mQ4iN9KsZMCMCMViJAzeY2WimUrTefxcshQj5P+a8eoKo2FiT093blkCoW66EQ+bIIhSJkLr4niBhirxzuDufwIYPS432XTzrod0/OqrDMcklqUJsVRzEaPRoweZf8S1VIM+nZuAulgY44k0ciDEZzBI/ReeiyIXLQLA/Es28d87fXruOqySW1C2Ctatdw+XsNxdUOsbaDouGh18Wsu2lkqOi5K46gYqnX2+0IQHFPirTOMROdAEzyrQRDioQlnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio] [PATCH REQUIREMENTS v2 4/7] net-features: Add
 notification coalescing requirements
Thread-Index: AQHZrT8lA5LjiQ8JCk2mTPx0U+Sf/K/C4JqAgAUfLlA=
Date: Sun, 23 Jul 2023 21:39:33 +0000
Message-ID:
 <PH0PR12MB548110479D1811D0419A136CDC3DA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230702234410.47546-1-parav@nvidia.com>
 <20230702234410.47546-5-parav@nvidia.com> <20230720151917.GB184015@fedora>
In-Reply-To: <20230720151917.GB184015@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB7199:EE_
x-ms-office365-filtering-correlation-id: 9f3111c7-e46c-49be-5445-08db8bc54dc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pbKj9vZI7PEEg8hxH/LLqsNR+ZN2FejFLd00+RZuV4D6mcPddnY8tNygXHC527sdo9FU/lHyp6vzQZ5MsT95oVoCeOS4tIe4Z7I/Ve0kNWd6x5tQQ4O8iPooc2nPLm3HAu8gcKGDbNRi8arCHnX9vj7V9XZbDDDti/hkCS16yVRDpxZD5uopysGdPap0+QIL5U3evDfwrEnNv36A92rcgTafVzomYFmL821+BqTcepn35bvzJ6Iz1BegvDvNKSIh84tYo5rqF0rsOG8lUNO6VdbIX/bMbOzgVEM1aC8O2qeYT2wAVgMYEt433IapBFerOCjZqqxXcEsVmmkpQKS2vvETzWUbI3q3qUwmtLpzWADA4NdOiE9Uig4MM0OkSPE6HlABBTIpYwscZTY7cIElu2HRLzJd4Nxr//BxBSlCYVvCc3uKGNI6y+Ea/mlMRy2eYDfWAAbRTdxH+J6Lda8woVZEnUGzcPclY9DHJig+XvsGQIOMVCCVQAaQ8N0YpWUGYvfLtE1oHU144m//4/qu93/Z2RHBuXKHtth0l6/FcQah5khLzhpOu8b5ynZnBq6AuMOyuvOwAFMGQIsAbbGytQazhqIr53ATelwLDcCRk/azvIJWHpeMUcTBx+71LLcP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199021)(2906002)(52536014)(15650500001)(66446008)(8936002)(66556008)(66476007)(4326008)(316002)(41300700001)(8676002)(64756008)(6916009)(5660300002)(66946007)(7696005)(186003)(9686003)(76116006)(6506007)(478600001)(71200400001)(54906003)(83380400001)(33656002)(38100700002)(26005)(38070700005)(122000001)(55016003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?E8I95wNOaaNGVjXpw4Zl4DOI/Npv3z9L+p1dJykUiQ57nMF249GStKF2W24j?=
 =?us-ascii?Q?7b0af/+eyxhafcYmcMdjtlFcryvng8cgSp7oDrc0qhB57wj3ryiXFm21Aiji?=
 =?us-ascii?Q?Etv9dy+hgg+c5kawa0Dox2LfY0GaIMkQLLxsMqxGYkCzkTuShNoyrkj1c+Fi?=
 =?us-ascii?Q?gQOZnSoux4VB01DDvWTsqhSDGGAoAIkK9NGlF8Jhj33eYpyCEx9oA0NeJ438?=
 =?us-ascii?Q?y6zczLcjfBkXkYSfqW3AXzBBPknuducWUen34ERuLzz88ZGggUdd0ML4Lge+?=
 =?us-ascii?Q?C5rD6+PBhyUkGcS3VwbcCjHhfCN/LE52tmbMbn4NW/Z/zMMPTpt56jQ5xHv5?=
 =?us-ascii?Q?fu70IYuqcTryjmW1I36qnDAg01dUTbd2bYk9VSyuQsO+LuqZIRyGHyVtQBIX?=
 =?us-ascii?Q?b94L+JfpaswBFfz+1bKC/rIums2pNeGLsP/92aFacTCto2x4E9ykaYPZaEMn?=
 =?us-ascii?Q?eMTOIGvHUq/7nC1k9FJnOPgDvwFdhfAGZoCgRKjejd2e2lWPkVap+djZ7qdi?=
 =?us-ascii?Q?eqfUJLO2pgOSaR5Ss6zc/E7wUPoMXAHUNxA2Rb0M0PYzi2tHf4mApvUETyyf?=
 =?us-ascii?Q?75Y6ZEL18NQmZ6Fj2Wl1dck6m5QTws+QDqZi8tu3hONBRVxkKbxAv2XFggOu?=
 =?us-ascii?Q?wIRQD57YAIyTIyt8Jt/Wl9OracCv8M/APTL98BRlZwAScI7lq7tPbW7ZLZ9j?=
 =?us-ascii?Q?oxT508mDiLrmkUsafSPdSXEUhxn9z8KQyLntfPyH9eyffBpExs2wTbDxEM0n?=
 =?us-ascii?Q?REGorSEaSHFO5CbGFoogVP9c7Z98Q83iN29cSCvfq/5WiFlJTcPrAkE+NOye?=
 =?us-ascii?Q?uZ+QNDcTKqYYLh2a2AYIaNyq8WJATZ6OmQ6HgAdpBclBpE1XVKKi2IU8EJcK?=
 =?us-ascii?Q?kEitJaLLIYZ6DSfHS4v57BCHsNX4Nvmp2n2vWbGy2Tj5kFEWByr4q3BT4MQK?=
 =?us-ascii?Q?99zmousONtD3dFG5oP6QOpy4vkYba3+APc7kG6ru++xFSRV/WGFOrNqyzXGX?=
 =?us-ascii?Q?GNzn0hwr6y7Td+ldK6ONp0iFnphOYqxkHBqVNAghngrX5uiZ4JaZklL6S1zP?=
 =?us-ascii?Q?aXHCt0aAh1Jbji2RDu9sS7CJDMR8pf2IRgDrEd9YXfaA9aH3Ng67WLwOQGiK?=
 =?us-ascii?Q?3jwr9zjS/8nCpao08BN4d2PgevwQZ1Hd9mbEZv7oMkyspfUS4FTC8a58ExQF?=
 =?us-ascii?Q?UhQJGt78LczmfjYeCiiHoNyJKuskfShfIrZvKic6SHmIdCQjBDj9onOH855N?=
 =?us-ascii?Q?0PwlI8N9KIb5XiojNHEwlaZhA/HlDXJ7XpW2Dz0mXr/YtwBhx9yqiIbLLtqE?=
 =?us-ascii?Q?fOX6CKRNEDQJamHH7bQwsYDiMfjvM7GdIBJZwXfS6ygiXIlu7fCMmi9sIdtR?=
 =?us-ascii?Q?OOB3erVB5UdAam/pnyu2L+g/7bvRXiN2ZfOsUk8wDaF4C9aQhUWVqtM1bciP?=
 =?us-ascii?Q?OFNRmgD+91cBc1uSONc8ZFM9N0HetH6MQ6Km8x9dg/4M41719kEAV/B4CVcP?=
 =?us-ascii?Q?G0qUNGaXi8t+mzb8hxanCmFeeqzoJ88g9pqVRZaWIwGaNUjhDIPFuyZnSKmj?=
 =?us-ascii?Q?xPasbOSI0+17URSSIY8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3111c7-e46c-49be-5445-08db8bc54dc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2023 21:39:33.2130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KsOO/Rs3F/Mrd8MA+Rj1mxYRLYjJ21r02LwfQEoU3GpxlxMwCEra7KMfX7eGgIN5qeyZuiclB8Dchuzj4tZuyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7199
Subject: [virtio-comment] RE: [virtio] [PATCH REQUIREMENTS v2 4/7] net-features: Add
 notification coalescing requirements



> From: Stefan Hajnoczi <stefanha@redhat.com>
> Sent: Thursday, July 20, 2023 11:19 AM
> > +## 3.3 Virtqueue notification coalescing re-enable support
>=20
> It's called "re-arming" above but "re-enable" here. Please choose one ter=
m and
> use it consistently.
>
Will change to re-arming as "enablement" can be easily confused with queue_=
enable and reset registers of pci.

=20
> > +0. Design goal:
> > +   a. Avoid constant notification from the device even in conditions w=
hen
> > +      the driver may not have acted on the previous pending notificati=
on.
> > +1. When Tx and Rx virtqueue notification coalescing is enabled, and wh=
en
> such
> > +   notification is reported by the device, device should be able to
> > +disable
>=20
> "notification" -> "a notification"
>=20
> ", device" -> ", the device"
>=20
> > +   further notifications until the driver finish reacting to the
> > + already
>=20
> s/finish/finishes/
>=20
> > +   generated notification.
> > +2. When the driver enables the notification coalescing reporting, the
> > +device
>=20
> "enables the notification coalescing reporting" -> "enables notification
> coalescing reporting"
>=20
> > +   to notify again if notification coalescing conditions are met.
>=20
> I can't parse this sentence. Maybe "the device _has_ to notify again ..."=
?
>=20
> I find this text hard to understand. Is this a mechanism where the device=
 does
> not send further notifications on a virtqueue until the driver has re-arm=
ed
> them?
>
Right.
I will rephrase it.
=20
> How does this relate to EVENT_IDX, which can be used to achieve a similar
> effect? I guess the downside to EVENT_IDX is that the device must DMA
> repeatedly in order to detect changes from driver, whereas this new re-ar=
ming
> mechanism involves a hardware register write?
>=20
Correct. It is similar to EVENT_IDX without polling large scale unique addr=
esses on the PCI.

> Can this new mechanism be generic for any kind of virtqueue, not just vir=
tio-net
> rx/tx?
Maybe we can. Haven't found wider usage yet for it.
One needs to create a generic interface first to configure such things.
It was kind of implicit requirement that I didn't write it specific to this=
 feature.

Config space was one way, but we discovered, debated and agreed that instea=
d of config space, we should have a dma interface to exchange such info bet=
ween driver and device.
Its now due for many features.
I suggest since receive flow filter has such requirement, we start with gen=
eric interface for it and expand to more like this one.

I will revise v3 to capture your inputs further.


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

