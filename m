Return-Path: <virtio-comment-return-7982-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036BAC25B6B
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:22:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6966A2AD55
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:22:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 50CC4986A52
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:22:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3D0D1986A4F; Thu, 26 Oct 2023 09:22:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B8BB986A50
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 09:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDVD/4FvOWY9Ii50T79+OzA2v3PEJepu0+bg0APwYg7D8qAdDfijQgGjKuuTlR2aQnMcXx+qvMK26tiVDP7MvgWpBy+4u8X2p+4oYFxFxp9kBm1SOWrauxngYTS+RoTI9ToFLInnzqPo1HHuNAKcVKGvvfIUXfBmgi+FVRxmqvKr8YAUni9OZmxICHzkq2Yld3EIk5L3ryAcXGlbx65qDLE2SjMlu9fes5fgeML7jzXiLsr+EHwhsI04abyX8M/t6H+1r403HCzuvdJ+NVfvPIL69DX/eNtCUYwOULyIgsl7mG0NZJYZvxYxhaXkcGjpdENNC5gdszCEdX/XHbbTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIAqwbNoIn80dnyEnCP++QdogBbhca13YwJcpeMoUqE=;
 b=f4iItJcTb3VYVMoMKkNTNhsFOGYvBFzf6jsvR0KjDbr325HEIh58dLXsoakZL4BWeyWyBwBAuMs8hQMh0SyQgXh6zzK0crU/JJ1zswCSU2uht31q0f4WPl1RqghXWALG2j+zm++Ei6aZbCxrGEDznl4VsAkYBAZD9BjoAOn5/ZAQu2ZSA9r5NsyLJXp5C5fXxx+0AzvJxtaSLyw7tHJ7cphM7z4v5BH8ZsJi5W02Zrt2MrtDHbTCXFvvA6MMIOiDB1VdIetPGsmnASKvKKUiROIMvw6GBehsKCo3001lu+UniAL71n//xJj2yQzLLULpFEUUO8rJhVZ5GQUTBtevrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>, Cornelia Huck
	<cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IIAAA0oAgAADzbCAAss+gIAACFOAgAEc2TCAACXpgIAAAYlggAAtfgCAAACsgIAADVKAgAAAq0A=
Date: Thu, 26 Oct 2023 09:22:25 +0000
Message-ID:
 <PH0PR12MB5481692710B92E5C01A61D4CDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
 <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026051556-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231026051556-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4252:EE_
x-ms-office365-filtering-correlation-id: 240be868-5ea0-465e-deb8-08dbd605110c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aoXM9m1Qh9w/8bhIYBo2qWvfhjNGToOkqWC2SwwQBKNekp7gD98xDj8G2XEwfqpdXaovo80XFfCAiZIkfbyNa1zqd9xNWdf0kyWsymxH2+pLJON452MDQi2EQdIaev5ceB8YLAhrpl+uwfrXNTQIIGeajwFRwhWmJkZd3brwZl9RQeWwbrELrrtQJmgQeMRtN1fwj6ppAP6u8XDLm+kA66rpK0EjymiNuFAea+hVgMBgrBMBhK4NQv9QzMIH4vPgqIH2H2Flc1EMyyPjmQe/ZBHSY7/N/LRwd4lWG6R4UHhp5ZgGLgeIbTfs2N1S5tigoj06W3CEdvUEL6QHz5Ehyx33A/l+jzTJUqJDL3JDpH50hd14eIoTVtEZVvs+KBGcI4bGjkIQRb5NcJV1rCcKsN3Vlt/0NQMxHKehqrtArAMHkM1SKXavZncZiMYNqLyKc84N4myO6xHs4J3Hx4t2UqYNrb91VByEq1oCaNMX9jAmTT8jDCKT8Kfco1I6UR8cfuoG0f77ZJFcMLmSZGHBap6Ltfhe4ZfPgRdxJBTGqxG/zM5gyn/6lvZbV8OhVQChC8njZFImyjwK2Z4TO8QhmUkUI8CzAk5YldW/db2Yo3gkKVGeYmdIcBENZwMRGt7e
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38070700009)(26005)(38100700002)(55016003)(2906002)(4744005)(41300700001)(5660300002)(86362001)(52536014)(33656002)(8936002)(4326008)(8676002)(6916009)(54906003)(71200400001)(66446008)(7696005)(478600001)(9686003)(64756008)(6506007)(107886003)(66946007)(316002)(76116006)(66556008)(66476007)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mw13FzLLdXOyW3Ai+RU3Y5EQ86IRUKcWDfurjNUUq6v0eM8L2TOgnxlSKohd?=
 =?us-ascii?Q?UG+7yvILxP56ZWrJT6gsKEiZ23+O/HbBXCJYr1OdQ0ppzJ/b92E++e+ExMtw?=
 =?us-ascii?Q?UCp7pRSm8HQ8tIonRmNgo2lDBuNjFg9ay3QEBWXEv/UWYEgNqAkCc6SRQsGT?=
 =?us-ascii?Q?gA0HjYqME/TO24y58i35JF9Rli2SkMOB2B3xS0HHPqp6E83v4lEJmcs7IUWP?=
 =?us-ascii?Q?aokd9wy3+/IoRYgwBxI/q7fWcZupGytRr/jNBWHZp6i198ONNOBzbAb5JtLm?=
 =?us-ascii?Q?IP0YI1Nr6/6BbvSc4NVsaFrDfata6Vov5fKBhBlGGMuI50jZU89j4DUgz4St?=
 =?us-ascii?Q?1z/AuucupgCsqpg+KN0G5ybZqba0Wl6ijPgXw7RaxTdhW30sjNbf6O92cD/u?=
 =?us-ascii?Q?vgX8ZCfNGLeiB9PI5Dwhagv6JIp6gvpOGNXE+J+Mvao7wBOdqIjG867BLruK?=
 =?us-ascii?Q?w8csWhrXnXxaYJ89Gmznhz811IAsObhXotejSYc4R1TkyQZyNAvXXbTDJTDA?=
 =?us-ascii?Q?CkgVq4meW65BfSczn0un7O//bKFDyl7L4dXCojG/ZyI8MfLU+6QnGzJNtJ2w?=
 =?us-ascii?Q?YlYlYnTBUz2zY8gt2ebPmfzrY8tN4tLUR/OosjFPyQOyVppJcivuaeXFpXzF?=
 =?us-ascii?Q?1Czm3NrSNFsX7Zj8c2imyKPFJGJ0Cgbk9nVrbvbIIrf+UIilDjtO58xkZYvh?=
 =?us-ascii?Q?x+O4BF2RVT9lSaV5IuumIMdnYa5Jtw5QTFOnS0SXXIZTqoDIYF0W0Qt/Ey4A?=
 =?us-ascii?Q?ANgHOPTST43ZFr0Zx2ch5CDs9bXjRXPZflu0eZZfNNBReC8MUog79B/Url2c?=
 =?us-ascii?Q?bAxJWPTbgj5g7MlEWcJ4Haz9E2H/Hp2RrxLPkDIt4Qp7KSD8lQw5S/HFD4Nm?=
 =?us-ascii?Q?7F78BU1QVona+tF70ShAQ6LYdVjyXMq48Fd63FgUtoJF/CnVtEnt1FrhagsY?=
 =?us-ascii?Q?zZMIdf8JWhDjb4/XmMHki6HWvWl2rLL8O7BfVhawKxgRxi9WOSHjTt7cMvFj?=
 =?us-ascii?Q?Aca8y4dRlU3k2kMig0azsq1087obeai29xr5DEt7j8U7w/G0+RUmfTzSdhcM?=
 =?us-ascii?Q?OnBDrcD2GOd/tUE0hDapuP4ZRxjMxdEnqY/aLgTGyqk9A8aBo1HmrhVIBOoO?=
 =?us-ascii?Q?kq1vysMxzE/YWuz2nteLYY1y8fX8nuLo1Z2jJfBBXQvKHaG1TSl1RYpDoYLh?=
 =?us-ascii?Q?o6tmv7GJq9LQYF2TbzwA1yT2y8DaM4gMSLLJf2KpguAIt9XwBSjIXSbqtaUp?=
 =?us-ascii?Q?w3gxT3RoyEYABsNXY0OLAhP0Qs668+uHid1WDCYw/NAsgNbIeS3BvDD96LcU?=
 =?us-ascii?Q?JYAATN+ixNo2s+X8vE5rkYhzii4qgYHQktsrDab7U9SaATC1so09hzjGRnw6?=
 =?us-ascii?Q?AKYcldvT3YYfT5qGLhDyMsJMl9cF984uQPpszetJotvQJ79TeWR9pD8ryKuP?=
 =?us-ascii?Q?pJ1Li3wjRLRWje/yQcpThtTjuHK+YyZNbaTn6CLGxFQ71wFKbRg/ZhVYpX5I?=
 =?us-ascii?Q?MNtHc8HpScoDVae/EpumneESlGYJiVkJXoE9j14kbJq2XcxBvU0aC7QdMGWx?=
 =?us-ascii?Q?V30jvMi1YbWqnWbvrtA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 240be868-5ea0-465e-deb8-08dbd605110c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 09:22:25.2095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/THoqc1zk1erK1FXDbSyDdrhDlPOSGNOoej0qmloIWeWRlWm4tShLOxTtiO3fZ8j1Ub0Q3y5SSYWj8JTBjNsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4252
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 26, 2023 2:48 PM
>=20
> On Thu, Oct 26, 2023 at 08:38:51AM +0000, Parav Pandit wrote:
> > > 2 can be solved if we allow resetting a queue before DRIVER_OK,
> > This is just the hack of enabling and reset for no apparent gain.
> > Future devices may have many queues and enabling 1000 queues, resetting
> them is just an ugly interface.
>=20
> Yes I can't say I love it either. The main driver is to try and make it p=
ossible for
> device to know in advance the max # of queues that will be used. We could
> alternatively just add this in a config register maybe?

I didn't follow your suggestion - what you want to add in the config regist=
er?

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

