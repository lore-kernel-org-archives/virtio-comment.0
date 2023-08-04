Return-Path: <virtio-comment-return-7017-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFA0C04A6A
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 07:30:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5F3962CAD8
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 07:30:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 391469866ED
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 07:30:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 235549866DE; Fri,  4 Aug 2023 07:30:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0FA929866DF;
	Fri,  4 Aug 2023 07:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoeHqpjd0DWRKuXc6boZw6RY7Bm8m6urRKwhrc+k0zYjFcD0klocGn5vetqZlxTgxWO03LSV8j+H5PB+Y9QobsHC3YhVyZTWZDWkt3oOySkz1wygWS4289/f5MpYIzYLvodZb3W3Na2ygGWQmgCVCV9BDsPK5McBPeszmAZ1OJhQrgXw2jZ4fSQkr8lgbOZKud+xIke6cpVh70oavooiZmmxHRVlWwmxW0ojKohJtRdNya1zI1Q8UlvU4AVygRAX0uABgesP4YHLelzCw8UMLCyvsND/caAnngwQrJhyBtdXFURgDGlDtT6DmMy5vZvH18y7huMm8+V9Dp0FIBYCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcsnGuXUTlXhVmce0M3i9q+P69iC66oNuTtPqZQ99tw=;
 b=STcA1HqK5JGy+GlzGyOJ3bzRHZGhJ8NiI6jjfwob819vjbWDAHhLnG+uTiWuMOWRhxm+Ry3+9+yZe5A2aOA4byRdM6jFpqz1TwOvEv3OwX+xRgYARPfscBU+CIs1NlS7HD4cps+YbrNoaNtbF4tPo6i2gVufZoJ8sY+JiASgIB5IRGfreuJbqBRyfhNN2S56CiEBNVGEIdyOEHqY/s6D4atOamzsoZa8XNxPzEhwImFC4rbc5WzmRxVtiRL0D1t53jf1nq3kLd2dxG9iQ04n1in/5VF5dFH0koH7dsBCFebC7clhuNtCg3RejRuXmBsNF6AspgK34l7IWFXGNjZu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>
CC: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements
Thread-Index:
 AQHZvd/S1zVkOCRsJ0eCMof906XE7a/XL16AgAEzr4CAADgYgIABHAlAgAAUhQCAAAKv8A==
Date: Fri, 4 Aug 2023 07:30:35 +0000
Message-ID:
 <PH0PR12MB54814571128E5D313192D4EFDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <20230802152525.GA13690@h68b04307.sqa.eu95>
 <PH0PR12MB5481538EEC183EBE3FF16234DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230803130725.GA47086@h68b04307.sqa.eu95>
 <PH0PR12MB54811B738594B741F8F8D723DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230804071728.GA7515@h68b04307.sqa.eu95>
In-Reply-To: <20230804071728.GA7515@h68b04307.sqa.eu95>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA0PR12MB4351:EE_
x-ms-office365-filtering-correlation-id: 140f146d-d8ba-48ac-35a0-08db94bcb176
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 28FDdfm1A8gtWQmpBixRkEtzXifoCCSwtstd99XhUsB0AiVnBlKa4BMsSe2uUM23c+TcmPpNpsOR9ElTjm510nCQLVhrnSCpXfVOQmJRc50QT3MTmipci/nxmIhnBQGeJ3ZXOL8ZuqaH0O0MJ+qYUwNchlrWHDdjgXhNRjpo/7krHsFAB5Q1bohAbsI9NRmD4JHIc2eWxjFKWyA6DDNUmWPpG/DZ1YlmOI7rrypTrWsWP0NVFzJH36g3ORCzuoSajaEwgDXivUNl9ZFOxNzwIzDyleje7NXdHSPzE2AriAlYUgOJMQwLH4lRYFkcPeXkmmQrnIrSUrB1GWUfvxqalVeo11Snhu7IlzmES+3Xga7y7GdJruqdumfqvHFyK/G0xXjlF0L6D/Wklsj6GN8D0iMCtuQPg2DzGBSz5fvIuJoIFSi6nIkA4/3oQy3WGiDpTnPmfpBThJc2yYfg4RWcYjkWgenED76lWdnrkURb9Z1VcRdcMWVDS3Y6u50aflSKcDxwj7aJfcimoVJYCcF+Ck9W45OOoWbLPPNwqDgAeVScPoIWygzdW10u7Tdhc9a0FRWzFTWbOGl0oXfAqasTisVXTvQWfcLLm4Ma5yI4OxIS95TnAM7L8pCnDUeSIe2w
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(1800799003)(186006)(38070700005)(33656002)(86362001)(54906003)(478600001)(55016003)(38100700002)(122000001)(83380400001)(6506007)(26005)(41300700001)(8936002)(8676002)(9686003)(7696005)(52536014)(6916009)(4326008)(71200400001)(66476007)(66556008)(66446008)(316002)(64756008)(5660300002)(66946007)(2906002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RM+gyG4SVfAqZdMc5WnJ9RjtRbxBoay9uyzQgcayoDaraf11UfdKuLj0eloe?=
 =?us-ascii?Q?+Jysj3lSWtVNUMp2NClRoF+3ViizTMPtXOEundHsYL0ghniAG+bYuWys2AG/?=
 =?us-ascii?Q?47njgmrc3cRW5B1eWwU3JPMOrz0GyDtNQBN45linpPIql04U51fa2UQQtVFZ?=
 =?us-ascii?Q?hsDtZ760u98kyEb92LthgStUuBqL1pbQbKA7YdHCOg7Mk0YqKo17DvMf54PA?=
 =?us-ascii?Q?MJOgynAGjFoTa4ayVnG4Myha5JG/2RgCVq4y+mHGR/lNaD/uXHhAZIVtMWAo?=
 =?us-ascii?Q?GSeX0t5m39R4pH2XpWh+qtoeHPNa5JKlIt+fiBq6I9DKpnXhkpcmY/rGCXqb?=
 =?us-ascii?Q?NScikrRrnMwKv3vfvQA/q0GzmzOnEdryMdUxQ6FUTQ9jloUPyIMNulslGwrF?=
 =?us-ascii?Q?RCLH14nlgPWcrwsa32a0BhS9n4BnjzEG/dP+nq6yFaymYAKBMLkiajJ3AcEj?=
 =?us-ascii?Q?wZFtcwLOCnR3i2PSRZn2s8IyKBMmd3CXLNtDft7B660srsYuzOrqltjUwRVF?=
 =?us-ascii?Q?GULKyvWUqXijW6SHDnWntQLHsV/+sm35SCUt5sFxROuzmwCaTYn065oOmI9a?=
 =?us-ascii?Q?6fxHp/BuWnw+z2spQ+URjgrNvfFc44UyNKpPdsop+fcZFz5IzwVtqU50bq3y?=
 =?us-ascii?Q?fq3m+PlNlkGXF29CnbrIMruZWZgZY5WtVvRAq/qcsSecymcRwkPZPU6k8B0X?=
 =?us-ascii?Q?w7MZNgBlnR1FoW6uYvOSdZx5wDYRxH/AkTCgXwt4GGjG0MSFSfj4zyQ7jETs?=
 =?us-ascii?Q?DqBEuulOC/6lG/uMYcUHNDXaR8QAh6scwr6P+7qy8FtebrNZqTcCNN9NirxE?=
 =?us-ascii?Q?iG+LunWc8rEmlG2TGD32cEHfUadlFPRqB/mPcma/4Tk0tvXJiDnNjEsaALLT?=
 =?us-ascii?Q?aYWFoQ5t4Tk+L/5xoDuYUrh7h1pd9PBJc0WdqXc3G0Ue4jlYWVm0LG8JXZ3d?=
 =?us-ascii?Q?yohBwp+de4d8cXAw7v71XYRbSBAZSibp3mYC4TDPmh+voH41fanyLzvyvDnH?=
 =?us-ascii?Q?5uIbx6yEJaljWc8dIyTXUI/jxGx85zwu46osTYUceOMK1DJh6eqFvtTxObfc?=
 =?us-ascii?Q?BrFbIAlTEQ+lLvokhi1tDDnVNZrgWCYxvojnJFjOELFqOg0aSgZDdbGF5fVM?=
 =?us-ascii?Q?FhYrDq62lHh2ZNZrmRet8Q2RPhiER+XbZmwCvMqa0ZOIK9SeD6/TJSFuZUIH?=
 =?us-ascii?Q?yqmY1tVHTRKYbAFT8RlusrfqupRfIrLrrAUSkXd9yMNmsAinln6vyvl9G3sS?=
 =?us-ascii?Q?zLS/M3Ymzq9+vt/AbNX6CNUj21g+k9I6dypjB+n54Vz7qSq3fJgPFP+0SNLf?=
 =?us-ascii?Q?/8FaiWP+vYWhs5ihTYqEuoHAXJkZOQjF8R7CHQRwes1WS7nDDlvkkISqKQUk?=
 =?us-ascii?Q?T1t2Dnj1e2Zp+w4oICS5XKFdUNveqCdHnKuCgRXo4Ra9E7/+u26vd5LycRtv?=
 =?us-ascii?Q?Bh/nv32sdywqP2czCBZ/1YnRfLilANnVoCVPtEUeoaNpTJNmf8vj5L7efh63?=
 =?us-ascii?Q?Kn9WkINVi9Y7x67yanuS8D/xHBSzODw/NeSB5K3QErWAV3pHjjXb3zXPmHMr?=
 =?us-ascii?Q?kGoqIUl65FMUqVw6BjI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140f146d-d8ba-48ac-35a0-08db94bcb176
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 07:30:35.4544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S126gBNjEWuNlZWUdd8uQEYuO1VZvneJHk+DWDRK7uXzzVl6RDvqQ9E217Y2gqnBRnKJ3dgk/5Ib+j4rB2ob2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4351
Subject: [virtio-comment] RE: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements


> From: Heng Qi <hengqi@linux.alibaba.com>
> Sent: Friday, August 4, 2023 12:47 PM

> Yes, but a small update:
> If flowvq is created, RFF must be done only on flowvq by the driver.
> If flowvq is supported, but not created, cvq can be used.
> If flowvq is not supported, cvq is used.
>
Looks fine, I want to think little more on the last point to make sure we a=
re not missing something.
Will respond by Monday on it.
[..]

> Oh, I got it, I think we should let people see more details in the next v=
ersion.:)
>=20
> > For any new/undefined protocol, if user wants to say, In a packet at
> > byte offset A, if you find pattern =3D=3D 0x800, drop the packet.
> > In a packet at byte offset B, if you find pattern =3D=3D 0x8100, forwar=
d to rq 10.
> >
> > I didn't consider multiple matching patterns for now, though it is very=
 useful.
> > I am inclined to keep the option of _any_match to take up later, for no=
w to do
> only well defined match?
> > WDYT?
>=20
> I think it's ok, but we don't seem to need the length here. But in any ca=
se, I
> don't think it's that important to have or not ^^
>
Length will be needed to indicate how many bytes to match to.
Lets do this rule incrementally after we get the base line done for known R=
FC defined fields.

> > Lets keep rss context in future work as its orthogonal to it.
> > Yes, your help for rss context will be good.
> > Lets first finish RFF as its bit in the advance stage.
>=20
> Yes! But I worry that a spec that references a concept that doesn't exist=
 in the
> existing spec may be blocked, so if you have no objections, I will push t=
his work
> forward in the near future to help RFF possible blocking.

I was probably not clear enough, I propose that lets remove the RSS context=
 for now in the RFF.
Once RSS context is done, at that point in future to enhance RFF.

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

