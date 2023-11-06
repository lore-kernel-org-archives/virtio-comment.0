Return-Path: <virtio-comment-return-8208-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70330C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:07:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C995E6E6CD
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:07:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BEB1898672B
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:07:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B4B8F98671A; Mon,  6 Nov 2023 11:07:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A779F98671B
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 11:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fn5bdIYSgIuU1R84/EXSogi4VbGfYhSWs2ACAYC5PUwVp7z48wPSvd9BmTJV3i0VKq5pemYetUfqxB7vfYE1wYyAokatzgGDgIc3LbEViibZl4oHtrqjHdJdrINgKJQ3FC+xpyzFr2nDvM1QMMFyggTIocH1PirhWXU1FpLnmnOxguTLT64gexUbMpstBCOliaKmlUGmMv8tg4R+m+gQJbytKPGYwdxhWMAmG7rLgD3nKHlb8a7ooutVsfp0AAF2V5MMCl+ylHzIpIczF4V9IjIQyB2ME8vQiSUPxyv7Y5RmDL9DnfFhGP+Ysk2WPw906TIH3y60T3pOrDepYIn5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQb4TSlv1L0l5NXL3/M0/2dfvFfsVS/EzhZlR5z/T4w=;
 b=R2ZrCyhiQLtLgOmM+/pbgbvEpm7fpnxib4ZSPQuk6Uk4KK8H08tkAD2DiZ7+dVmHJ3vDccBAppPagOcdg7XoCFqkAzMoTnPWkp0Ci7e4ZWA+0yrlRd5vQ4z2cdSN7Vm91h5iZoKimRPqL4kjeC9EEdlcZDazosHstofLzKnJiqW1ITMpNEaLAx+bf0JDRTWetu/89EuHtTSEqMXzPn5QwVfk2Jr+UdBI49g1V36d5XZ6YYdvdsx1hh+BEKVrr78MLLEJcVj4NkyOnN7ie7LmifmYrwahkKEXPTW3BX7XmGnBhSXoj05j4eKmM3uQuM9LUTyqm/cdcCkhD38qDN0fCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 6/6] virtio-pci: implement dirty page tracking
Thread-Index:
 AQHaDkFr7w3tkrCqqkSwyxm5dwAptLBoapSAgAABpXCAAETRAIAACO2QgAPyz4CAAAX1wIAAWYwAgAAUdVCAAAUygIAAACAg
Date: Mon, 6 Nov 2023 11:07:24 +0000
Message-ID:
 <PH0PR12MB5481F256FE79844AA66CA035DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
 <PH0PR12MB54813004E47B8F18DFAC1D57DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231106060447-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231106060447-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB8527:EE_
x-ms-office365-filtering-correlation-id: 0a56f219-dab8-4fb2-d816-08dbdeb88e58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RLwkPUjg6xYFJyEavO9bZMYD2rQllua8z9zAVHKSntEGWeeKzLpSdvVEhw17MQog66RL/DfREuZbbSj22L50Wvda6l5laUtvcTJ8LjrbWaNZ8SkKd88ME1kZGuj6/CbhVjTEy7CmohHrFeJoSZVASXCicsD7hIlOuQSFXJNrS+ARDsDMUKLO6gHXmoRz3xObOjAukE0cMjobhdry9k1jwSDlgtdQIrpxwwVLs6KGzn0wjuzYbxIh/lNIGUTXMKHufspMAXEgIIz+lOoAvINWdSTGMUH+/Z5CAiCwpCOxF5qN/Z8YoDYaOD6A9RwGj9IfBDuQoApIr42rrMkD/1hgmkboPoich+aklfrWFIP0peS39lPK9rABxmUcahh8edWUmlAvI2Kq0t7LD75Bf99qKxQrJgRqsGb5iFBqd/OqYkTprfBzfT4va7yTsCqWqFMS8FB6iX88pGi20Zcfi8q34hgIW8YUfwRLL9y7HQyRhDEWwBXwEmJqoQmd+5znd8fb9wweURPHbVqJ32AOyoiqNzOPt1SqKgWYGNMEllfVKIFVXHf4Ag9F8zBdxRMDYj8SclqiUa44E385L3OXNbOTAknQ06ki1nClhjozlIUQOorN37ZmW4shkePIu+y+uWm7w0Ggw7HmtgGzMByRUAEOcQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(55016003)(71200400001)(9686003)(7696005)(6506007)(478600001)(33656002)(86362001)(122000001)(38100700002)(5660300002)(2906002)(4744005)(26005)(8676002)(38070700009)(4326008)(66446008)(64756008)(66476007)(66946007)(316002)(54906003)(6916009)(76116006)(8936002)(41300700001)(66556008)(52536014)(14143004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ue7OkvCWMwlPw/dwocupTRc9oizKcb4k797p0rrs9WQJoLRmwoYfYOWjsEgb?=
 =?us-ascii?Q?zpuPNM7NcANdiicqqvb5Z22HGqpFew01a1pMr05H0keKgYmdcgX76rUBT0gp?=
 =?us-ascii?Q?WD5qLYr6frAAb1IXEUjicHRYuJwpVOXJHD35CgAvJKMsUBEQW9kGeaOhvreF?=
 =?us-ascii?Q?EBpNtNYH1eTe/S5wL+djEN5OpoasCdCzvgjLaIYixFVGfj6CJnJ0Yd4kq+jv?=
 =?us-ascii?Q?zwL8H7XAU5GAUvGUoA7ylDTXzL9Aou+OAV3hH7qjClp+HvkQsOxDcMM0b7a7?=
 =?us-ascii?Q?rWMaJGbsSpOPx972UVkujD6mXkvP5lyUkMhWIpmB1S51BMvzNOfyqEzFDlIv?=
 =?us-ascii?Q?7Jv+NWCJ0ScYI5ry44KjTHE1Vlm3bTse5LmqNT5aAtEP99w8wNg5CG3G6JcU?=
 =?us-ascii?Q?RvW0akwEGW1FIjlwmZ/+A3BKodzB8+J250KoikrzZAnduIJd+SliOLXe/L/n?=
 =?us-ascii?Q?ZjDIRC6BKq7WVx9sdGrixj7hWy+EtqXPyunePjQPXHld5S5BryWUmML27k1G?=
 =?us-ascii?Q?QsTU1xYcxgIr7hRoQjr+AlkWUych56zDxJOcbC3PczKJ0VtpsQC3YxdPxbld?=
 =?us-ascii?Q?OV5/YE94PqrAXKQ8O0HBUivjdBubap8n5ITrIGDt11ezrJRD4ENQVhBKrhAX?=
 =?us-ascii?Q?9ElgGl/ZYGGnsdFaKhzWXilsNC1H80ce0JIb6/XFWWoewE6OcZcXoyDiZtTu?=
 =?us-ascii?Q?jmGdFqs8mmyf72yIReHql8qgd1Z+BOK21GoLxyy7nxQAzIpF6ORF+kb6qyLq?=
 =?us-ascii?Q?EgtUP0IUPGe7D7HlcMBayMTN6oIKlPuMueTru8oCoabcHhnmk5GfROX1/wC7?=
 =?us-ascii?Q?2dBNM9ZT7d2c9o01wptiiZgUHxwKRzewfJl3nbLhvxP7tz9zY8oX6x+t5ohz?=
 =?us-ascii?Q?nwYmtfQa7Yr74rQpn5ozALn1ThAYwU0kLn5AbdAYGBNuJaW2dJK1W0eIDsAu?=
 =?us-ascii?Q?5g/6BOqTR/ZSBstTYa+tdidgBNNtA3Gg7VwtoQKfmoQflAg3HzXfmVar6UYO?=
 =?us-ascii?Q?eSigHtg2KM79Fcm19pUg2us6tFfRTpWDAy+8ckjkbDK8ZVfZVT/2pN1OlIKM?=
 =?us-ascii?Q?MBvmgItWX6BG1nQXB14PN8tQHtxsHIsm2hlclynbF6MkVqpolK3oXWPoyuzS?=
 =?us-ascii?Q?7SKO2iqrzlbhT0jO47g4gOhr3dt8W0hrt9Q3jyE1y4NU7z7Fxsefb1ikokd0?=
 =?us-ascii?Q?VW8X4XHk5HWo9uyqiMqBcWgRpebuQnyX0x+Yd4/8lAqOZa/ZnzMfpMsEJKR9?=
 =?us-ascii?Q?ggRtnuFScvwAsga4et08kYbvcGqX0miSqctUFD+KOVZcGzosjFpYfS9NV5Gx?=
 =?us-ascii?Q?xM+sBdt1yRk9iUhI8Xl0I5F/hflkLFCq638sQBxVGgMI67TSA+iSpN/E/uq8?=
 =?us-ascii?Q?rQfB+HRiPnS6Sf/iHE3/uCpEfacfA0uJQ2wRsppNVqi7HkB8UZ0ByGCscLYp?=
 =?us-ascii?Q?9FzAfSw+pYOZJNUSaWTxk1vbuQJ6RUn3tglbGjyD1oSiKYZ8WNixpEXG/Z3e?=
 =?us-ascii?Q?n/TZ+4D5YVA0MQXeVYN8t0VGMw3ILFG+xuSSA1wh4axuQYtgpdvWWfZ5L5KU?=
 =?us-ascii?Q?5uR0r92NZ+fRZLY1YBw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a56f219-dab8-4fb2-d816-08dbdeb88e58
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 11:07:24.6381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lqu4xGcc+0uV2itltRjSGZ0fT2ap8KhourI58jD8xQPOWXjdljEoQ1ziodQQ5Bfs9xNZdfs0S/q9mtCX4Jbl7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8527
Subject: [virtio-comment] RE: [PATCH V2 6/6] virtio-pci: implement dirty page tracking


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, November 6, 2023 4:36 PM
> On Mon, Nov 06, 2023 at 10:52:46AM +0000, Parav Pandit wrote:
> > I read the pci spec and I see only 3 operations which does not have ato=
mic or.
>=20
> CAS+retry can be used to implement any atomics including atomic or.

Yes, we considered it. the PCI backpressure is lot that negates the value o=
f such retries for such small transactions.

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

