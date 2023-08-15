Return-Path: <virtio-comment-return-7112-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69449C001B0
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 04:01:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C974E2AC46
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 04:01:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B562E98638A
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 04:01:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9F680983E53; Tue, 15 Aug 2023 04:01:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8AAE498633F;
	Tue, 15 Aug 2023 04:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSVhDrJ2fDyGs5AQhLVmFI+9kWG4ZTELLVXM+NW6mHE9+aXVA7x07ai2c+ht8XfK8YkzdrPpj3w+uUlxUT0gcjahqUdi2RsANNG00pceKBNWfJlw//KC9FHViAEw0YAfv1jxs3rHaDBJ9tELQ3gohITqrPBvCwpdqSR4iKxvX4OPEWl3zgVuN/SLiWE8Sugp7ozT8bfXBErJQ/v4KKFWVns0BHYSl2f1XleLp6xGBh5kL6G+eIm0YGzeW8sWJrDA22w29H6n8AiNmNBDthgFlP5xcuFCfm6Gtpa/tL/YK5K/N/yH1x6INaPs/w3pup7wY2YtqZPOhzpA9Z9Exlh4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzjBxtbluyZiyidVC6HY10+zKTZvIqRgkLKO1dT7WXo=;
 b=ap3flTqlo9Ln21rU0VwgCBQdbFdovp8L9uXquW34i+Gm2zaXHDmODcOxDFyP0CBdHZaMLC3EDoy/ccxwJ/0Hiv3MU40qOx1LYOtELxiLsElDzx7P5Vvts/zv4faj8we3sMCmRjx7kzIMcTIvSn91EOa+jQyWqPzHkUQEhHKq0fZxA1NnsZbAfhjci55JinlHJ2zL5NL25ZxgUPmZjBxhkVToz7ocn0hZnWFLfCckNyixuIAyDjwFVHfS2LDxrzlgtjLK9esfKnb2S7Lv5ZTsDxsy1zin+BwoOfBGaNLAfFL4VUinmQUB0sN3Y6IYI8KkPgNHT06bRmxMo8tiSZk+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: RE: [virtio] [PATCH requirements 6/7] net-features: Add packet
 timestamp requirements
Thread-Index: AQHZvd/P0UZ+85qNOEywdrF+BteiUK/hvTGAgAgmroCAAOYDgIAAE/6g
Date: Tue, 15 Aug 2023 04:01:25 +0000
Message-ID:
 <PH0PR12MB54812C5D39E6E22F07FC4874DC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-7-parav@nvidia.com>
 <1691570137.0487022-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB548163BBE78CF4E43EF6806FDC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1692067643.3169255-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1692067643.3169255-1-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB8775:EE_
x-ms-office365-filtering-correlation-id: 83bb15e2-34bd-4950-12f3-08db9d444b7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YW5xbIBZbO5wVmfPJyG3WuLY+k7uhTkG31Aj6pyagzljyVSBuxBH5O66SlbVKhGdesOMRrPRSxnRqrn5lBHLEhUGro0TmTw3w51zBrV2plPQCZZjgt/2HByjuyBGNo5u34aNZ2vyp/MY2BbYNA68E7LCSk9xQwfaeBY7ZdDrweLFcJ4XjJIDSEbj11I5YCGlgc94k9xirjmnVykNAQdXsjFYYZNwU3ab9NrcqWn0XMIXBX8FWy0tfC4ekLf+ip7Yoj85jLsjPEa1pckCt1ArOXUY4NXkmlTi+Vd7Bk7r2cqpEqcD1jqxhflVz7D0Zhvb23Ene0Lv6Bq5KF/XQX++pk5C1r+YJw5J/GmSv7lUJ72sK8ncOv9/n2yvhpsj2g0SjwUDuerb4x1m168o/qWwoes/ji0nOQPY01592KMAFzSAjirvmUSojBszvniZZkfZAxNIEw3rG5N74h+1wfj6hY+YU79yJWBnaCL5N8VZiG1yOJxf1UQCM0paPePYqTqQuDMFTnv6zpMCrw/SSmmuedlaJ+8xdXKzeAvX7w3s3OYa2uyeFj+Tzv2QZcK0YomgTWxON3e7ewKO1b4Pq32z/bsSxu5MzXX8h0h4wuw6S/j5VeWyX2nopu8uABH/0cFy
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(366004)(376002)(136003)(39860400002)(186006)(1800799006)(451199021)(38100700002)(38070700005)(122000001)(55016003)(478600001)(86362001)(33656002)(4744005)(71200400001)(83380400001)(2906002)(7696005)(6506007)(41300700001)(6916009)(66556008)(54906003)(64756008)(66446008)(66476007)(316002)(76116006)(66946007)(8936002)(5660300002)(8676002)(4326008)(9686003)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jiyvOWmxwxi9i9WQffSf8k3uCKGDdlRH1dMB7g69xuwvrvwN4TCTAQrk3Rvj?=
 =?us-ascii?Q?CliooCDMNyn+ZYJcL23TzgmOyZzWA2/yrdTSeRn2xpWQ/N0LdjS+MPTx0HPh?=
 =?us-ascii?Q?ljxLJ3D38G7e2CryYsuzJbUq+upI84KNQCN59qRrWKABq1xcm8u5kye7Onft?=
 =?us-ascii?Q?i21okgvMejGTAZjq60lZHx9ytdqNHvGu+lOycCTC+FInQHxHWvJe3Y6fSzsV?=
 =?us-ascii?Q?LIJ9MZDWZyAjopPTnfscLztBUcNPu0j795vm0i1Xoa5ADpVE3NPUHX1gi6z6?=
 =?us-ascii?Q?6LVAdiBM0KXKFxpjoYE8iE6xhGUUMAdbOFBREeL3noiu8mbPbnHwR9aHjsoa?=
 =?us-ascii?Q?AX/PWtBvBcrK2ZBddriB8N7U3iuoprecttMDZoOiSE2TuqluUHcUDWECL9aC?=
 =?us-ascii?Q?i4JGZtqOgflXMVXzBpkVVoqzy0lJhs4KnUIv50vcLnFgpUVNBBIStSX7wFwL?=
 =?us-ascii?Q?i+Chlaa9jeWgQOlrxDEvy8xQE4F8PQFkFiYCrvytUgEX8N6SWPAp9G7DjiKc?=
 =?us-ascii?Q?FDazQdb4to9EzP6DMfskPYyhxxdv4P19ZachCPOOBwM7VqS7YT8waGE3SzDN?=
 =?us-ascii?Q?yMeTmOEPWb6AuoOTQIdZGDLJFoBg9iPWsN3LxFqgWq9QFaKj2NmW262cX6rO?=
 =?us-ascii?Q?VsHCiOS9xrkBJO/3XGM3/dXJYSw52p6DmNWhDP8o045jzLXjQkP4IsgyF4Tw?=
 =?us-ascii?Q?m5QlMyq+Er7NxHUkkEs18Lx84ZDUug6o3Mv/BFKYkm8TUQSipLUyYZQ7pEdJ?=
 =?us-ascii?Q?uBCmH/cZ/1dnAqFpVBu4zvEEgbAGOBJCTh5JzXBl2xazWupJ/YYWnYFcdrGf?=
 =?us-ascii?Q?3RLDJmQxPPDUFiFHYCWOcPAbkRdYp0vYuco68i+cgsbpJnMw577T5JW+yjyI?=
 =?us-ascii?Q?IYFPdGiZFiXrvQouSDREUyDuFXHzSMarlP6zPiiNdW6U+afoNodZEzdLIyU3?=
 =?us-ascii?Q?DfVDcJ9O0IHIS9s1iID4dWbTV9pR6NWdonpXh/AKkyq40l17N1DhabPtSOBI?=
 =?us-ascii?Q?uXZpwltii5wK2QXHDvaLzGJT+Pu8iLNjob2cex3PpcJtkBE4vZHRVOMtVACr?=
 =?us-ascii?Q?A+XD/fVMdNtKgOgm/ZObuYziIQYL47+EfR9ruJqrkMI0udiPi3Nvtqj1XsjM?=
 =?us-ascii?Q?JCkbmTEFdKG+QaJkvV6yHWZmZTqD297SXywYdbOpHHlyyYLUTFYJ8M/dc+qs?=
 =?us-ascii?Q?uPjKfhkDrw2dMHPi267wc84U616bU7SOVr3N1GIQeNjhe+19koyhT+SgaKHq?=
 =?us-ascii?Q?Rx4lWgsHPr1PT63cmxN8bffbcAdzgfYMj/TX6G9+rewGn+dkVYfBcmhUcGzP?=
 =?us-ascii?Q?2KM1kKfi6Br6gEUGRt5fdHqeqo/5u60w+1S2KgJ2/rJvqoii+sTAs8DVN6bs?=
 =?us-ascii?Q?meJWPiNcjQM8D4DbE+XF2AcifZeENtKpMJLSiC3PdRo+JjXO8XDsWJP2GnQB?=
 =?us-ascii?Q?evSIv9ZxHhckil5mYM9zL5guzekuUAWEWLCfOjj+xT+hFPEWsfpXxzHG72cr?=
 =?us-ascii?Q?1mQUaqKfA3BoAhmTKUDUYKbEChZciwP3MdYnr03flPU/Vh9ez6mUSdGdHWUJ?=
 =?us-ascii?Q?NjA0yYtgWccO0rPt89+h++5mZk/Afv6fILvIu5hNNof0vqyOKC0pYouIUJsJ?=
 =?us-ascii?Q?43WvwT2jy2mXFG/6dWie49A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bb15e2-34bd-4950-12f3-08db9d444b7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 04:01:25.2653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+hUuRtdasGNmIV/amRxxVzNxIGHKEM9ek9O7jMRCae/9iAa431EvqrfLpT+psymA7rMxXao1XzE1W7MDBukbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8775
Subject: [virtio-comment] RE: RE: [virtio] [PATCH requirements 6/7] net-features: Add packet
 timestamp requirements



> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Tuesday, August 15, 2023 8:17 AM
>=20
> > Packed q needs yet another format.
> > And even after that we still have to live with other limitations listed=
 in other
> requirements.
>=20
> I would like some simple changes for the tx timestamp.
>=20
> >
> > Therefore its better to do the new desc definition one time which enabl=
es to
> optionally support timestamp, using single descriptor format.
>=20
>=20
> I agree.
>=20
> But we can have too. In addition to your plans, I would like to introduce=
 a simple
> method that can be used with existing machines.
>
Can you please explain what is a "existing machine"?
This is the change in driver device interface.
So one needs new driver and device extension anyway.

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

