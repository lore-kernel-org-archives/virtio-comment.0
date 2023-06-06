Return-Path: <virtio-comment-return-6164-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18255C77B73
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:25:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7009441EE4
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:25:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 680DC9864C2
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:25:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 562189864BB; Tue,  6 Jun 2023 19:25:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42F829864C1
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 19:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF3tR8dgDdQtAaUTuKowe3BxJzRe8DpOlxABJlNLRhdSw+pl6on0uvyg+7V7VNWllTa0wm2tv15b7WleSOT04wFE6tGA8qCVB8ZuDASdxnAaf2O6kea231D17wIT14OPPGfqiYlK1YXWJEJ1oGE5636w2QUsHEEe+ScmTSXEn2uNlEf+zGXHpK8YTcBL6E2exe4dhvuh1VkaYDyUFB/QmHjIB4zVFr+FoUGz1/RsK5fJoFgHKlZcebyyrVzMtMR+bh6XmlfxFy3I6ZoAjOYnSOXlySjRcxFSlKp7eIxXi1FH8ISLkS+z7ahPfq5Cf1CvwmJvyDG88uhKdWKPDEq42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2dDYbbfBUdU8sqq2dPD2SF3kD5AzVztWzQqTCaF/64=;
 b=DH0+b3E1ZJJ6DCayY21Z2WGTTfGiNXYHLp5NEpEKqYUXEldDe4S/rY/RevyzopEgIr+UyDPqULJaNQzyYfQKunbM6bCdvxzftcZu4bU7AYuolqBB+9O69gE2pnDp1gU+ZerBH0t+Blqs5sAbW+Sybbo00zV0DEVVQwA4kD1zSfqCXgQG0Sk4Yom7orEDWvzB6SNOSqpuAIEak8ubDgItxspCscPONEWccW9juM7DsUCGo5w8DtHh6Z8b/2d6EI+8SMFeJkZC1pyxmI83eQR90BlKQyASjEhWriNatZMgx9DiiN9hO1cPPw0ggr3ThI5ZRmEfVUGBmxHFfqNOcZiW/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: =?iso-8859-1?Q?Eugenio_P=E9rez?= <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "alvaro.karsz@solid-run.com"
	<alvaro.karsz@solid-run.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>,
	"longpeng2@huawei.com" <longpeng2@huawei.com>, Dragos Tatulea
	<dtatulea@nvidia.com>, "stefanha@redhat.com" <stefanha@redhat.com>, Harpreet
 Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, Shannon Nelson
	<snelson@pensando.io>, Max Gurtovoy <mgurtovoy@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
Thread-Topic: [PATCH 1/2] virtio: introduce selective queue enabling
Thread-Index: AQHZmKAVwn3zg7X1EUufTilOdi6rea9+EGGQgAAWHICAAAA7UA==
Date: Tue, 6 Jun 2023 19:25:46 +0000
Message-ID:
 <PH0PR12MB54815243B0C6942A0E5B6B5FDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-2-eperezma@redhat.com>
 <PH0PR12MB5481D1ACC60311CE48D622CFDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606151520-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230606151520-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BY5PR12MB4919:EE_
x-ms-office365-filtering-correlation-id: 6b42ceb9-45d0-447d-48dc-08db66c3d404
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Jx1nAq2JZjGAQLtBes9b5VNzwq0ORp4j3dsqceMs2VMq45VRbiLfUsqow02HFUUg9NNrqjkYXai2P7L8Hvmah5eCvHI4Kc9a3Papi/uqxEbkKOPHYsM7l+H81IzdohRkFR5GvFfM25DZIxkHldFH1M8UotodOXERX+mmOxCCl8FTGTsuBsy2g6idGzXqGxbXB9DSWjd0PRlh3GqNCedCq+sYJnSqxUgitSHjU1gVeDPHOlL4XASjeZ5OViKVWuv1aRPP114m1KYGwQYUjZDGOx/Pem+DntScZQe938J+1w8oKAqtKnynlCie1ahcgBcfozZ51DvwFB2431i7st9SgTwTLuuQG/UPfzVXlLbQARC98PV4vFGzjsf6oq5pP8hWggsPCuEz6uzLMMRLw9I1IlhkrJe+kesq0Ch/vQ3G1Oa0O79/MNxxNuobkuCOw5grPHlficE4vEKlsVYSYTflh6s05FvSkpxAdjimCIocZCj5vwZ89CrvSVlB8Wj7Mz80tB1i4Y9l2WZBp2bgMMfz5EmKsj1V1Dg6fvbbAbuEtkADG4m9OEsl8L9QNoAPUKyAQdZjVkfOj/gjlkPo/MsmhZG3ee/N1OLoi5tuwC72gT55Y1fepaJx8/D6oLWPZ/b3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199021)(186003)(478600001)(26005)(9686003)(6506007)(83380400001)(55016003)(7696005)(316002)(8676002)(8936002)(38070700005)(86362001)(38100700002)(41300700001)(71200400001)(33656002)(6916009)(76116006)(66556008)(66946007)(66476007)(66446008)(122000001)(2906002)(4326008)(5660300002)(7416002)(52536014)(64756008)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Nc/jZQXlrkkkQwFZ7pcNQXerPRVkNVEAuYEbJ1J+O+vK5HTzU6FaJUupl5?=
 =?iso-8859-1?Q?cxZI304vUrR9hUZbfF6Z+9r3Kv1qaBiwTpQ+z1DOOoNRyeMx+5BXsAWEz1?=
 =?iso-8859-1?Q?vvvzkOpK1842jtCveMcIygG9u+1sTQ/vl7LO3DmIIku6WPuOs6W5wfVvRv?=
 =?iso-8859-1?Q?fTxI2t5KCbne1VSoKgveCa792NcF+hQTDUaetBtBiNr7nmzKd4/zQ/7RS/?=
 =?iso-8859-1?Q?8W9dglaJXOWH/foMo68Vh676WtMkuze4LO4xIDZpvn5UvcU5ylJududYYD?=
 =?iso-8859-1?Q?Lw0HcwaQnCS1TmQTkQxeiLOnOemoqnCLHDvmjSH7fLYlAlVpDtj5ODt8Q5?=
 =?iso-8859-1?Q?xFS4bRhYvcEXLTIPYf/SFGGz7mdvdjf4CirxJ7TWLdimegfLWhiRY61NcS?=
 =?iso-8859-1?Q?dAPhbzPn8JCz7fbgNrWS/fjVqXy3wKbhJ2N0lEQfaWs374L1IZkNcz4cKx?=
 =?iso-8859-1?Q?FCEQOXwKy1Au5D5AH1ymTJSsLsG25ks/0G/7EIuHe/FD6G8z0Rc5vZVWZ5?=
 =?iso-8859-1?Q?kBzf/1h4xvAIya9+EkX8QUZIGnd27D/01onNiJ8p1iN4kNR9FWutRwSNOh?=
 =?iso-8859-1?Q?ajLl8mv4gbMcsCzadYPZBeI4BG9nl/Dljvsj6vefj7mw9M8hRSU59l+jYy?=
 =?iso-8859-1?Q?1qLg2UkDnwKMdq/clzkNnM75uCzZxsSEz3B0dugVI9xciHLGP0A/Z1URW7?=
 =?iso-8859-1?Q?iLIynhFgoRanUevKb5WcM/6YdpkIOo7KrehvR/8yzquU7dsQhQ+JtQ6h3P?=
 =?iso-8859-1?Q?Ky/HXP2sjCUHGgPKrpzwthWgBc2OlO/+/mLbISt4ns/kfuZ6CuriUoTR9/?=
 =?iso-8859-1?Q?DxrGCEFUVsGujJjXoM9xlVFGoOBdge4mxlL+SAuYv0dDPLQ4wuu0qtQdOP?=
 =?iso-8859-1?Q?SEcS+p7qeG3fiidcgE1sd+kbVsM6HhVPWKIhsTxjYRFkaoo5JJy8OqXnca?=
 =?iso-8859-1?Q?esGQepRIiDi+JY3Jnf8d6Mlr+h0AR39iknT9a75feulo8QfVLCLPyjrA3b?=
 =?iso-8859-1?Q?3VfjqkbOGS8hsGLaW6LsKotvClM68hJyZFOkSUTUS+xbLgr8G1OBNQBZtj?=
 =?iso-8859-1?Q?Zwi/lnXYr+zsF124XXKxVzKnc/SeEVJyLoTZ5GLe4Hd2SzYHok9XnWPMDR?=
 =?iso-8859-1?Q?5ONJTa06mYtxAm/47yD3rDWhMKHbX5LC4PakTR2Gr2hYxkVnES3PlWf99a?=
 =?iso-8859-1?Q?lZNNNEwQpcjtuLt2onyLn3TJMWnzxJHPpEWcjI4WnMk9JalZY107RnKNo6?=
 =?iso-8859-1?Q?2/chMAcJ3QBlPV9Qe/kT35x1Y2m/Bt+yW4x09aB6ssKfJJkGeFMK5xkGJ5?=
 =?iso-8859-1?Q?3vVqLqfFs8nTTeYUl363T+gNU9lw8fqwZF/Ul7HN2GGtUAdZ0HJ5h9Iaa4?=
 =?iso-8859-1?Q?c3yinG5Kiks5PFXvXqqHRTHYM+DWQlIyIjHgfB6fuDzqfb6pkPHdL4Zq+t?=
 =?iso-8859-1?Q?GyaqBU+t3MDr4sGewe7mFNqNug/lKiyUaMk0UpZsb4fE32Lfe0fDK8Kp2A?=
 =?iso-8859-1?Q?NwoVYouNlmyJRtXJsxsec2Q5wLKXwdc/np1SUxuuX15rgKhLGAYRUN/IqV?=
 =?iso-8859-1?Q?MfinTQ9sevLQagakC+aav7o0d20fU0Z4K8FGYTJCnzStVOlHXjBMjKvZE6?=
 =?iso-8859-1?Q?8F0f4N43ZVo3k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b42ceb9-45d0-447d-48dc-08db66c3d404
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 19:25:46.4213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G6/GuZETAHw+sAceZ0/yDK3IFDyZP22JMBj8an/B4ReAjBDHo+x0yDybYWNrZEFC9yHj6ylMHzMCUuHtMZz4QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4919
Subject: [virtio-comment] RE: [PATCH 1/2] virtio: introduce selective queue enabling

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 6, 2023 3:20 PM
> >
> > Can you please highlight, current spec normative which indicates that
> > all queues must be enabled before DRIVER_OK and more queues cannot be
> > enabled after DRIVER_OK?
>=20
>=20
> This one:
> \drivernormative{\subsection}{Device Initialization}{General Initializati=
on And
> Device Operation / Device Initialization}
>=20
> it does not say "all queues" if you want to split hairs but I think assum=
ing it's
> safe to enable queues later is dangerous.
>=20
Yes, I have read it few times and every time I concluded that:
it does not say that it must be done before DRIVER_OK and cannot be done af=
ter DRIVER_OK.

> E.g. vhost user backends tend to assume no new queues appear after
> DRIVER_OK.

This backend implementation can be improved without introducing new bits on=
 the guest side.
Q reset is already a second example that demonstrates that queues will be d=
isabled/enabled after DRIVER_OK.

And for PCI transport, PCI device and driver do not restrict queue_enable a=
ccess after DRIVER_OK.

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

