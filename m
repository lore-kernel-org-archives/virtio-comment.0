Return-Path: <virtio-comment-return-7073-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96640C001DB
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 05:17:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C93992AC45
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 05:17:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B387E98637D
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 05:17:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A1C2D983F78; Mon, 14 Aug 2023 05:17:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 91A1598633D;
	Mon, 14 Aug 2023 05:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/kzfQ+iqj4JIF5PWSzzWZTmQxOl6olnjRWlY+rWpKYPmA3Kg4tAwPZyBcdpNd2pdmA50WOF352XQiz26+xVqxtGQZgblCSznkl/ATQR9li3RsCpQLSFsrKI/Eqv892c3gAyGGdJLlpL4bJ2w8113E0dyg2d6PCKitH3VyOoKDwFfPHdTC3/QzMxV8aCpg6cXWN5Xv+W1qhLr2Luz2+k5DmsSKFIBGh8iM8Z5/AIwTUaI39Vc5/+5jF+vuahEedUGJfzMP99ysA5n5X2sl/MROAGEA/YnOlyTUrSgytF6SN11d1fJKeOAW+WnqkRie472SQDGlTIxfurJlN2hRGUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81Rkpe780+6ju0JtXaukcpj9RB/+O7LSmd4r0Nc4Ne4=;
 b=oG1OFq46PYiCKrBMYnuMroht/K5J8oKrXn39K8Re/RtiYeeIXZ55lua6FSRqGBFeQjKQX+httLP1ejdWkW9fheH+HhC2+oR1RRAtFnA2CAGEBiPtSTZDOQuv17mI5VYJ7SO/iBKYp8ZY7eEgSWSj1xBQ3FLZXm7p+iQYQhjhRbdrDYnczp5DBOs70jDgL/QfBpnJr/jcAuu0wEgGKetP6VPrRx/h1uzY5PIIM928I7iodDQUmcP1FO5KQuBr9biu9GB0lepLGgvGseTUNY3UGHLfzQjwvj9xcg/PA48/KofqpjzsC37gTPuqSKFt9dSDRRkGCmv4S/DRzM3Wet+6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: David Edmondson <david.edmondson@oracle.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4
Thread-Index: AQHZvd/OPoZLFEx3iUeR5LEYhWDy/q/gJXIAgAk7w2A=
Date: Mon, 14 Aug 2023 05:17:34 +0000
Message-ID:
 <PH0PR12MB5481D4EAE0725EF12F735D58DC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-2-parav@nvidia.com> <m28ramndtk.fsf@oracle.com>
In-Reply-To: <m28ramndtk.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB8518:EE_
x-ms-office365-filtering-correlation-id: f9bb4be5-e2e3-4502-6962-08db9c85c4d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 v8ddVbYqPD3jYLhytcFw0Y+O0/xqLtRxnYUqSsFsX6PgQypKP7URHaIvVqSeX/ZFMpp1XEuP5jaV/8zxcYnQEVjHHOTcHe9VkdUjsVY4L/5MpK9EdnVjkKvEjQB7LC7wk2smV0X9TtuFJ3W6JSTJE1bZX1BfLGz4Qf8Tm4upj+vTO+4tarY6GudptYO4WtkOK7LwP5SSspVb5/wfUcyaId3pmhKJhXRubHMs9rS/5xV9SxDpgkuOg6AlFrX9HGwMKBXq09ZbgFbT79H/i+jF02OltiuzarBCJ9mpWZ0401GtV7BpWALlLw0A9MorFrUDd1atar64at2XCBvQka0FfddwDjdsbDjGiAf79TrhlMlgCIudyi40OiwDSEFGnVsRfEFGBtfvqOdeEFUYV1b6xkXtUMu2Wr3q5H1IRN6U9LGYD2aPLwO6ksQ4+qbs7yepAxnQTHjv7yT2HU4KUg1qUSCVzSUl3o5lf3WHTTDtc+Xizw0fBH5PT1gHOZxuacFrJmxj7O6DYgd6rhT5VT+2/I1ew0lTLibzb1sQMDiQ2VBXEWrIDnxCOYrgGT6c++upKcjPsEaWkLXLfSCFNTOtC/zTVRmqe4r9XdT+eFirxJ4RzvenpaS9BxUPOiZbX1fmSD8/1UBAKXFKDcrACuDJgw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(186006)(1800799006)(4326008)(8676002)(8936002)(9686003)(33656002)(86362001)(966005)(478600001)(7696005)(6506007)(316002)(76116006)(66946007)(54906003)(64756008)(66476007)(66556008)(41300700001)(6916009)(71200400001)(66446008)(52536014)(5660300002)(26005)(4744005)(83380400001)(2906002)(38070700005)(122000001)(38100700002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GJfD2JBRcaZjhYzmnYriiqaFi9iJMNy9GGRzSZ4Ng1BwpuOTbR8IfTY0YnnS?=
 =?us-ascii?Q?Wt4TS7eU9dco+9lIzb3ReuvrHEeI2wurBiUsBb2ybDYLIsF4+SJVaOj3txB8?=
 =?us-ascii?Q?Ym11AR9cX111MhH2Rzb/Th8Ymgc1IvpMZFZc5YIb7K+zlbROldgAoYZekvDv?=
 =?us-ascii?Q?VnRULdcBzn250LL7qDYQNv3AkMm9asmadwdZl8n40ttYPHWZjozZE6Zn3ySa?=
 =?us-ascii?Q?HWQ/AVyKS9q3dQYVurpkJ0uQLbQb4DdEu1YXDoVIsEcAPYv9uzuQD3MYIO0f?=
 =?us-ascii?Q?r5YzuzDoIsP4jzljGuCbs+krm/poWdlCRCZtGKhq/Ja1bKLPcwHQmCDpiMDR?=
 =?us-ascii?Q?Rh9mn+rJQuvY0fsAgQl7Nv08Hku7ezw4AGPxWYsh+oaLhs+DJ1jdM0BseCcc?=
 =?us-ascii?Q?hJZJ+T6iA2Dzfnf2oCYH5FiCueNrwtarOejnvyuo0rcSEaCcbuQ+ss2INf/d?=
 =?us-ascii?Q?oPfZOMkJWFGRXDHXSvlGpE+3/8gAb7yRj3EkTHAQc4r1fkWFnXh8bW58T9aJ?=
 =?us-ascii?Q?ux8tZE/76GMV2usrGzY4Vhv6BnPmFxzHUobIz2euYlkuikJjVoAnQ/qe/atY?=
 =?us-ascii?Q?5JZsS+lbqvqEgj1M2VjQwKlsM1Q8G+DQDcN/FRO0t0SJrKV8ctDnUSEoBz4s?=
 =?us-ascii?Q?RsK+MtbIfNAhuZsQTiztLr3mUyteIcqDjN3Lj7c09P1K4bKhFexmdE1LyNPy?=
 =?us-ascii?Q?LMS5pdqsbWBYEnH618pRD6/m/qOoDuY0EX0iSaybLfE+SAdYMCigI1Ow47eu?=
 =?us-ascii?Q?ep87fEeGov0ydqrrm9jXoeStvFNG1d1pd/HgKqKTHFqhaPvrWfC3Ukq8np7A?=
 =?us-ascii?Q?dg8P8OwuXuLmTuRDomDKNetdb2ioQ3OInLjn/5MlZrAgAZl/FXOQ81hlEtCf?=
 =?us-ascii?Q?tydmzwNxQ7okmilf/rxbCpab9dhslOW3nnfiwBwXvZFGK/Jbv2HSMwl0XSOP?=
 =?us-ascii?Q?H37/saaVbK3uAponbQPXUbVqv4oFkmbzYACjSm6Azy5Iu9pSo9Qj8UzveZqM?=
 =?us-ascii?Q?Sfdc0APAm5b4oUgRrsLnI01IewmGtC0VDUAZ4XF2MmXWer1Vqohg03wzjD9w?=
 =?us-ascii?Q?hy/yjyio9wTd9KmfcHSqgwZiQJNSLgV4fbg4sWe64NRHY+y+92lDNVZr4Nw5?=
 =?us-ascii?Q?7uzbF/KBvCjtFMADkEbahS/ZxpAC5UlEJ35Qnfakt1FomvQFVvqbjhUm5NHP?=
 =?us-ascii?Q?SXrrYSmwaVxEbb+vQAGrY5hbUbcokP4ZC1DD051eIJVYGPjev6ENkoWq4cuW?=
 =?us-ascii?Q?FUso7u0z9WnVF/p4/DL+BWS6xyCryHfCn4a94q2p3zZwtAzH2ST7lRsIb9v8?=
 =?us-ascii?Q?TkWV3Jmesw3Hk3YmLqq1jxQ2IWGbwqhzvWnO3LAGRC4o7/SqhaBeaCGtplEy?=
 =?us-ascii?Q?T4tJVs42VfUET31bgXA8JNQH9yvTIlnR+E82x/aavO0KjX1P5rpBuJxzLzQg?=
 =?us-ascii?Q?EoI71YYSJdEaDDDONCZPHr1B0fJbwAKMkvTNF9aCamc3yQ0pW3Nm51WyR873?=
 =?us-ascii?Q?UR+OALaIrxdWcIwep4/NQjwNVohVY4n+ItvKYHxhIwg59KTvdndTNxoEfcBM?=
 =?us-ascii?Q?V7ogtDymF9tRfvPkLsE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bb4be5-e2e3-4502-6962-08db9c85c4d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 05:17:34.9464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6XvtW01DFBJ59N3Q/cHV1BzDRvdOTItxPqOEWI9CFBr1prghTyi5k8LuNMsdk92P/i28aMfqHwRgixEqPo1B8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8518
Subject: RE: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4

Hi David,

> From: David Edmondson <david.edmondson@oracle.com>
> Sent: Tuesday, August 8, 2023 1:46 PM

Something is wrong with all 3 replies from you.
There is no message body in them.
I thought it is my mailbox, but looking at the mailing list [1], it is also=
 missing.

Can you please reply your comments again?

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00125.ht=
ml


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

