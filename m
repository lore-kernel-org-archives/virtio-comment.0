Return-Path: <virtio-comment-return-6184-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0858CC7EE45
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:51:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 700ACFF2
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:51:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6637F98658E
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:51:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5BA27986585; Tue,  6 Jun 2023 22:51:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A111986583;
	Tue,  6 Jun 2023 22:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dy/c/qsfOqa6L9ekUR9HQOYaAGTJI1TkvIuOdTQxvf9PL2Wosj+8I9OozshdZBb/gQBmtYNRjRG4uugfmTURAk9yE8gfO9cBPPJFegK6qqN96mrAdAKpk17wqB+srp5kOuRZqAb99yTMQvsTA4wnicLrguzCUNiaauxI21y7mNVbjAZBIfpMY0fUIeXeWybZfJfOZ4G9NYii1zzeEcCpipa6qApJgV8zNs4WmOVLnY/RjdBSidX9s4hSYYlbNIyFEXckgtVR31JK69WZjNvf3WdDMbkO6FScP+f6CBtM7aqo2UzkEE2z7Cc29JJcmBYJj2NsNo/xZZPKDy9HKBD7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+GLwfVt5lcNSJMm04Udo6VQF1HDtDmG4Fm9iFATSwY=;
 b=Wq3asbdynyPisi96Q2YYvt+24Vlpknv2SQjCY7XeO+lvsF9Gf9NyNTYh02RGJig22KTHGrCg0xb0PZjRdj1SYvHzbZH+BdfcaEM1HDNYpjyuY7OOmIta3k88YL81IKwtv2dlwnvo+PXC9K/TNtkiiD4hmVW2LMi0LlKpx3zDXwLjNBbWl0CjxO5F02oG4WLXrhCQV4fbGodENl1RIIgODkXCUW7O0Wh7CInp6OcQbbv1OV8LMOGaE3+GRF3TbRv4PVFCHRDnujddWnvpKc7eskI1+9MvU/F+2QztxYdvDEtZb9uTbuX+tM7PtK5j5zZWAch8aTpizNhIO+Vc/7HLpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 6/7] net-features: Add
 packet timestamp requirements
Thread-Index: AQHZlNTpoasRHIYcaUOkNMkRXy7Tsa9+ZgIAgAACGlA=
Date: Tue, 6 Jun 2023 22:51:25 +0000
Message-ID:
 <PH0PR12MB548136CBDE586D6DBD54CB9DDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-7-parav@nvidia.com>
 <20230606183720-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230606183720-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH2PR12MB4231:EE_
x-ms-office365-filtering-correlation-id: 3eb35f13-47b9-401f-44c3-08db66e08ee3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rE9FOW/gDpSZ207SP8bm/C2jgJKggf545pcmALvzTvMF+un954uHNIAP3X/I/nELDn7GR0eXF4X3zM0ykL+zryA/+VTo+M11sdURVhuszUau/Xuz8tRHzrQlSI9x+pY2SXJ/Omgv5uS/i8K3/m2B+jomhrAkEfymJwFOhnmjTDLV0Yv61PuYXEJ2+rOaSQ2v2PfO9F1EqNsuOkOXzME9SbWTDnnFNUW7l/OMfmx69OZlj7h6eEbS6HNN8loDees4nSnQf2cOjt7FcJ/svBRqW24QKEm59+n05ZHObkHjhlRoxLlu8+PIlfdJlxh8AS3uptmonlhtUhEXQ2FVfpVLiJmdPmkm7CRMt9k2ako1hh15ku6BeNRlTyNa4e2JwXbH4CDBivXE/jUJfAvIkm2fH/eJZqmQd792sBG1SFICVaD5hZD4LY5r5CmXdkN77evMSVhCfZPHjLc9/vJcmMNx/56rPVAZKTAMLFN5MWuOshlqLVVxflPla1uVgTdvjdrXxw/yhYJmafVfyCheLAk7XWNFVS7/MK/STUasKwzR5UcDlBoSTE4dtEFghklDKHeqUGouokK+fnbdUhw5csjIQXK2zNycLfpnFMySVU15lJNCKG3xt38VBCiAVQsaI+5D
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(86362001)(83380400001)(478600001)(55016003)(33656002)(8936002)(8676002)(316002)(38070700005)(41300700001)(54906003)(64756008)(66476007)(76116006)(66556008)(66446008)(52536014)(66946007)(38100700002)(6916009)(122000001)(5660300002)(4326008)(7696005)(2906002)(71200400001)(26005)(186003)(6506007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?S4mpllGmbOIdiFnKqLJ9l7cVMNrBKiDFFtoiSfYWWQABqatpR320Qibkz4mw?=
 =?us-ascii?Q?ZlccIObEy4dbaaE+k4Err/pAaCpjeaJW8YV+YJlZhLO8a3poj3QQAWF3w0zR?=
 =?us-ascii?Q?Feaf0qhjMfe1c05CNSaovlN8iDKZZcwDWIxJieNfOeWp6cD9BPkSEiVnQKGZ?=
 =?us-ascii?Q?TQx+AfDovC+OMjWOWM6aT2+UT9xKpdTFCKlh3bjqQjZ3mZrR8SHUGp4vp2Kr?=
 =?us-ascii?Q?a5hzwx5wSOio5M8OTmVUFDQKBDZRUrox5KbCls0H8ilNMwC3+PqzalhBTg4x?=
 =?us-ascii?Q?qpHIAQv4VeurU6jtJfPKm3Ha3quN1PENm3zHfuVYSf1rDHof9x6OZy0DHXWQ?=
 =?us-ascii?Q?TuugMDjusTutkc4ySiLqj2e7XLfgJbuT/b8QH0ctAM2TE/pvbvFO4/VyYhgl?=
 =?us-ascii?Q?tqiyrfhZh88E0Vx4ZnOJquwLYW8RltQZTSTxKC29fJlwUzzHQDRFRukZWt8Z?=
 =?us-ascii?Q?18QlRyVUrYywI56nRh8eM0sWv10XGHGUBde0iT6oiTI26VpGwl/Ye9hLIYxy?=
 =?us-ascii?Q?0TZ1rxQrVmkc1Ki6WPVv88E+N6XAiCGBwvB63wLWAe3BMVg+ZvRAMwfGxAN7?=
 =?us-ascii?Q?qhsliudGvgg+Uu3RI9pzf5T/k9JhDlZWDhv+LJ66/v7z5JqwDiYclGXqgG4w?=
 =?us-ascii?Q?4wzHE2FUiD5eDOLELsdg26P9tQCHx8EDyOyOJ1F3/9Q+JspejE7XedIeZjcV?=
 =?us-ascii?Q?l7lyPDIp8Zn1YcHNqBIZU7rol0guyfSRQUPxcPFQGoO51qN2gEF8VPSvKRbf?=
 =?us-ascii?Q?gDSoB5e8+R3qd1mrn3EiT7vzaJz5hCkDMvoKfnWq4CpdA6Y3d7N5jAL88ju4?=
 =?us-ascii?Q?Y7erVUFWBMA67q/W8ew2ex/1cX/nP4hofw0PW2h9kucjJgSeu3I2+p9hoAEM?=
 =?us-ascii?Q?cAczHbXFMGX0tPZtCppAZA1RoAqaJ+XcCRUKD5xHYExCPU6AmBPT5Fle8TmW?=
 =?us-ascii?Q?cEBbroXlgqEM+Kkq0ul6vub5Wp0UeaFVirSa4PopoAy7wPY2hjKKouw/9lNG?=
 =?us-ascii?Q?q3mykuwyrJHScXdvVTWwlR6nI3oPWHcyYGD6FnwicaTLrd78cbBp3dy5B/4l?=
 =?us-ascii?Q?iXtaHfaSvGvlfnUZUbAgZ2qC/Wmum7zqo8z8zB/wfLM3GcjA8BZ39JRV8n0n?=
 =?us-ascii?Q?UlRphklSTbbFKbdavMNgLKgg7fsTwdaDsQ+2bH11GSIpA2YV9fcIXOb02zYR?=
 =?us-ascii?Q?ZjoR5wlnxP7UA00DLogl9VSrObVqx9tkyeagU5rqPN9hsOihY0zvUzxNr/hh?=
 =?us-ascii?Q?6R17v1AdqN7/zjZUPzaHlktxw+pLwCokz7ryiCxE9DIOWZ9XBF6B/nu3ieZe?=
 =?us-ascii?Q?nqWrG/wBYlw5aPq84FwByN6I1+uOCFWTzD4XVajUe+aCc6buPgYPTU7zOGaD?=
 =?us-ascii?Q?AIz25ykQfoLYt82bhGxR01LwSPeHArJN/8jnC60QjWaJQQ263meqAc78CKko?=
 =?us-ascii?Q?onziwkm4WVsDAKBVSkjPPRJ32cZuHhGOTjl9l1qtnHl1z0pNt7SS7v1rpnVc?=
 =?us-ascii?Q?4cIMje+Dml5xBKUxSSy5Ua5EvUpawjeJzxMKT+BzWCv/AKX/4sd3pASOzeRf?=
 =?us-ascii?Q?kZllJKxxBlIUslbSmZs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb35f13-47b9-401f-44c3-08db66e08ee3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 22:51:25.8618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IHiVu4QuxwxfndUIiaD+bpTJTSlSMFbyXEPimFdx/NqQtqas7JtNXUv5I+TsDufuScnugJlMR0Ak4WYW1ZGCFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4231
Subject: RE: [virtio-comment] [PATCH requirements 6/7] net-features: Add
 packet timestamp requirements



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 6, 2023 6:40 PM

> > +## 3.5 Packet timestamp
> > +1. Device should provide transmit timestamp and receive timestamp of t=
he
> packets
> > +   at per packet level when the device is enabled.
> > +2. Device should provide the current free running clock in the least l=
atency
> > +   possible using an MMIO register read of 64-bit to have the least ji=
tter.
>=20
> wow these reads are expensive. what is the actual requirement?
>=20
I don't understand the question.

> > +3. Device should provide the current frequency and the frequency unit =
for
> the
> > +   software to synchronize the reference point of software and the dev=
ice
> using
> > +   a control vq command.
>=20
> let's leave mechanism out of it. I think you are trying to say this is as=
ync to data
> vqs? and cvq is fine.
>
There are two clocks running, one of cpu where driver is running, other one=
 is in the device.
And timestamps are done by the device based on its clock.

So driver can convert the device timestamp to driver cpu timestamp.
This is like one time query to know conversion mechanics.

> > +### 3.5.2 Receive timestamp
> > +1. Receive completion must contain a packet reception timestamp when t=
he
> device
> > +   is enabled for it.
> > +2. The device should record the received packet timestamp at the close=
t
> ingress
> > +   point of reception from the network.
> > +3. The device should provide a receive packet timestamp in a single DM=
A
> > +   transaction along with the rest of the receive completion fields.
>=20
> how large do these need to be? ok for timer to overflow?
>
Will add it. Usually 8B.
But overflow after 30+ years or so is common norm.

=20
>=20
> why do you mention migration in counters but not in timers?
>=20
> is it ok for time to go back?

Should add it for timer too.

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

