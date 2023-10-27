Return-Path: <virtio-comment-return-7996-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C0CC25B47
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 10:28:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 170342A8FD
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 10:28:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EBA88986A95
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 10:28:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D8421986A8D; Fri, 27 Oct 2023 10:28:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8D3F986A8E
	for <virtio-comment@lists.oasis-open.org>; Fri, 27 Oct 2023 10:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hr1nP/lG1aoyLFlv4n0WSPbiqenhda5tst4641j62vBMXSMRjK9nenHR52fT7UGvGOztEI9J2v1sE1fgeGE2pLZ09uzX6mBq8/BwicVtc89WpzKCyKcL8lxCCB0CzCvxyqopoheEWgJ4/WMwUrX6RdENpJHJNii57zc+z77pfMWsOKy8LoMRBvoesZtYihFswWx+bMZ43+Zayinm6j8g2tGqsmU2Wu3A5GVYXKpG3ft1FeZYzkNb+APtqYwoEs65MAfeLnSDunhAp7QimxiPuOlCGInKvjjeIP/6b6Ut10+wBBsKmLc03rFzMR/bUta03vC3dMLqllFtMWvF/5nnxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbWTarGqD+Jo7UyNhqopido1tJP/aCC5nsHJvjFS1Rs=;
 b=dfWxlr69o2qn1kYY4XZ+cWfY6l+3Vu3qxVQcmWtCoR0vh0y/bFF9htg7Y8EA7YQ0/XKmC9FgJbVBzBLjrN5WlngVUNFa20c0UfmUSlFS596k6QbUkNmhpmvvBBo8RCtzoiFUbdwrVsjWOrwK2qDaO8dl6ar/dxZzW/ksG7OoBLQVYiTeNCDV8I0rZKSX7dJsUlV1JKjo1oTedgECdViklA+XmFSpGwK0k74od62XfX1ht7ZqXqOuKW9gejbIu/53y21dfSdtfqmpYUT+Lehrsx0lMzegELi1IA7j/AtDcHuTTtz0unM7OoAyzcvqsbJ/8PLsqqnvxWagSiOv+cuJPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IIAAA0oAgAADzbCAAss+gIAACFOAgAEc2TCAACXpgIAAAYlggAAtfgCAAACsgIAADLCAgAAB9BCAAAFbgIAAA0OAgAGb4oCAAACzMA==
Date: Fri, 27 Oct 2023 10:28:00 +0000
Message-ID:
 <PH0PR12MB548177BAE9336982471430C4DCDCA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
 <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026051240-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548176388094EBC243F879DBDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026052637-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F967B7040B19272D1253DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87msw4s794.fsf@redhat.com>
In-Reply-To: <87msw4s794.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN0PR12MB5761:EE_
x-ms-office365-filtering-correlation-id: 5b64064d-34cc-4c96-6dfb-08dbd6d76533
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ljsaJMOKdYMeJ8m1zCIuzbsDVtb4JQ3dGZC3HH1/t6HxT2qlLEp+pNhcP6x7hO3Uqv/vS3h3l1iFh0AZD7HJ5V3ompIRC2LukmO7QyAqP5j4Ccbm/DVqf1NoU3KZI0AthfO28QsgkLiVbVHgBrzy/T2s4HNy/ngPQLKouwfZDGnZICOlWfokve49lb5c4/8y+Z3h4IaBlAV3MT4kz/BmE0m3UsBIIW0k02klx4c5eN+Ezj0AawPGT+TnBNMjpEkn7vYuUGa6110QePMgs+VzbWWbkg5UYdGxH2E4YhE72czPKyiwJB0wYThIS/TfIv4EadI/aaC80VTjq+orfxqJBRBl+ON1l+OKyv0YSNO4nN6Lain/qyc2GXsIS49nEu1R+5GpSkzU7cdjUO54Z0iRcVkK8KJA2BsUa4lsdS90QsbWwyd8ZkVXOSuXO3LG5Zd2+KpRhlVspUXM2gEqprGJWxkB2U5i/ZJpB7nTe1CIoLdRUjTfjY8cLBiRLs0dQkZc7/0KAQz2neTSGrGmAB313rwNHfniJJEfEIJxSnrs0Nn53iDVfguWgZxvmL8Pkxj4Rt6yfLxnDqIc20k2CFxJbE2pyfn2L90oVrha8BCmwvWtnKC5K5YeJFGZbog0YirdakIgnHd+2YnG0NjbG5qI6rHrEoniNSxHNqkGmMQX4Fk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(38070700009)(26005)(66899024)(38100700002)(5660300002)(2906002)(55016003)(41300700001)(52536014)(86362001)(316002)(8936002)(4326008)(33656002)(8676002)(122000001)(7696005)(6506007)(107886003)(76116006)(478600001)(71200400001)(66446008)(66476007)(110136005)(66556008)(54906003)(64756008)(66946007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rFOYzAGPuJceUSGcbs1fdO0Mkseg877SgBjj0dvHNoPjC3mimYaICAANuWQb?=
 =?us-ascii?Q?2glZdKAERUygwIUQJ+amzK2leTa6PP9dIOmHY5I16CIi5hl4haGDgObTepvB?=
 =?us-ascii?Q?amcTueCPxrJ7hLLXvSjyBnV1hLW9r0nwpnu07PPp7cj0zqyRJp+deuVM7Rwe?=
 =?us-ascii?Q?MlkbCypvzOk5P6wfZ5PwooQB+r6NVVSY811oCVQoP9hreQQ3HLq4LA/YakVs?=
 =?us-ascii?Q?AAsAgYzj02A3aUpVkKragFGilMCNuzKvNOzJO3Q3n8btJ36T1QmhHWzsqFaq?=
 =?us-ascii?Q?me+v05NzUiluOrVUPgNOBGpcb6ZF72a+K4Omk6h5toluTXbGXqrvmdd12nmY?=
 =?us-ascii?Q?iIeolEq0af2Xt1UtbRnM7QNUieVA4MNRaMWC/WHiuzjqY06nW4htr2TBIO/B?=
 =?us-ascii?Q?b5uGOI9ybQ8wcqP3dihnHQLnA+VzKzrh7KHlyUEyWAGgDJ5HQ9KuH1cMdQOD?=
 =?us-ascii?Q?4jjWUXfV9DYsqqFkM054mI2xTNhqmpJDbLpkvFLUPzvG2eS5ssYEy0rcQL2f?=
 =?us-ascii?Q?SNkqpkDw002d0Z6Wn9gn3O+RG/6HiuLJIrq+c1HGimIxmY8GaecGOgPXfamc?=
 =?us-ascii?Q?dMPGomx3rH82leE2L7cDNBQ30RdUBt5gs+Rct+HLxqaFVeGGp2U2PA9oYfrp?=
 =?us-ascii?Q?z29klppHfTl4TWMx89tTNhoXmwyfEK1ttiZ7qIF8bm6qu466DUcqmy7SiMC8?=
 =?us-ascii?Q?bp5MSS6fInpfmQBTrn0naW8AK9CYDz1jtwOR3fUk4FvZgYyIvA039rjZfb5V?=
 =?us-ascii?Q?x6ydZG4kSDfC7er4CjpNMurOPojoqYSsUodW8mNZaElhrMmP6mdLCMTiXbXz?=
 =?us-ascii?Q?cB8qsHoBPiL/qktc2ahBaXwyR2ddHxkTvMmTeoCcBLg6ovYf3XCnMObgHmvX?=
 =?us-ascii?Q?cpZNTsyrtAXsikopebSD/1UgC3x9+wpCZh5wyTq6T1DNZEX5fKgAt6Jgz2/o?=
 =?us-ascii?Q?t3ENQs5KY92NNcf0KqGtceWXJNLcJXD+8O0I92vQ+HP5KuPkH4z1cSC1BcnA?=
 =?us-ascii?Q?8Gf5/xoV37jEf+iGCvFA8dU41TB6+PfVDpFb4XIoanR2Pf8dIfqOWC0Wb7CA?=
 =?us-ascii?Q?afPLgGXoVzjyWfCxvK6rw7FcOjU7QHoLpdXNenuL1O3KkCxUv5UGh9vPirKh?=
 =?us-ascii?Q?nyIo4W06Jhld+VUOu2jwiV5r8P/HAuhZ4uWm4HLIP8g3N1FSvj2Wj8+z4W4e?=
 =?us-ascii?Q?gWDoucTDGPhBohAfOYF/81NEVxOfstSYWmmWU8KSq0Q+SvpaFadIkfY0WcoS?=
 =?us-ascii?Q?TqN1bUnnOEdL5QRVKBhtdS2WnfWsJ2YJmEuE2cXgqxtgMaV+WSFGROW6zdRI?=
 =?us-ascii?Q?d+9f163X0R3yPTR4bUX8Xrw56co0c6JWhaYz2yqWIbl5ypDq1UmzW2KCxE4+?=
 =?us-ascii?Q?G5aFqAyqQNpq+L8DXO40vTJmPOFU3l0I/sqKwsqtjqOZcUB+lKUbWXxOJjVH?=
 =?us-ascii?Q?fm5cd0tZNsEqgxXK4OqgYx9VWpJeFF2iJT/T0LoVpgd6EkoGvdx3aEU7AM6C?=
 =?us-ascii?Q?/ZqS1YJfUl86DDbMN9F2g2ok/i3kuZ34jv31vFwt6yFSTxTS/QiDsJOgfjEE?=
 =?us-ascii?Q?C70U6QswUW5dLUYW1Qs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b64064d-34cc-4c96-6dfb-08dbd6d76533
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 10:28:00.7071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0zhqvoe7CMvPMkhcFLrw8S7CQBsHKq6riB6kMSXhcdAn2gaWvvO73Bmi8V7k1Kdh0xFb+VdbxGFHn58SkvdNJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Friday, October 27, 2023 3:43 PM

> > These are common commands defined across all device types in basic
> facilities section.
> > Those devices which has cvq, they define how to transport these generic
> defined commands.
> > Those devices which do not have cvq, but when they need dynamic resourc=
es,
> they will define and create one cvq.
> > As such devices will likely need more than just dynamic vq creation, fo=
r which
> it will need cvq anyway.
>=20
> I think that is too complicated: not all devices will want to add a contr=
ol vq for
> resource management, especially if other mechanisms are already in use. J=
ust
> using a generic mechanism guarded by a feature bit seems much simpler.
Not really, if a complex device has dynamic resource management, it is like=
ly to have more functionality than just q creation.
And for some reason, even if it does not, having efficient control channel =
for non_init is needed anyway.

It not about device wants to add/not_add a control vq. It is about how devi=
ce a should offer dynamic resource management.
From device point of view, it is equally complex for the hw device to build=
 dynamic config registers for N VQs which it never knows whether it will be=
 used or not.

Out of 19 devices, 6 devices already has cvq.
Out of remaining 13 devices, 12 devices have fixed number of queues as they=
 small enough in functionality that won't need a scale and dynamism either.
So for dynamic resource management reusing the existing cvq is more efficie=
nt for the devices.

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

