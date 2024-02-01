Return-Path: <virtio-comment-return-9058-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E85C47DDB
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 05:53:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6F1F72AEE4
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 05:53:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 508F29868AD
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 05:53:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 303DE985F66; Thu,  1 Feb 2024 05:53:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1C1799868A3
	for <virtio-comment@lists.oasis-open.org>; Thu,  1 Feb 2024 05:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxeOq97OUsya3/6bsfwc1v2gTWTtyRooSIZww86DUYXZkQ20DajK5nxRikN916kajnosjsF6vrfmf9Y+SeTaXVU2+6sOdUwFXLNbygjZ5sw5+zxZhpa13twkhMLAZG3boT8nHRF5Hq8vX0mAJe4utXRZHkqWBJC7nQnhWOaQsVRWrQSyPb0gC+EgAyk0jFCpyLM0XkATHN6p2VEjKu3wf1Hgyz06N6m/yEUlKEJQPzv84pAmyhHVCzLgT5ap+Oj/wJA1Kn513VxqJKWEO3lw/Q62MFCDjZnf3vqjluJjf/Rli5ly1tL5PUHXmmflSP5h9bcE4Xaa2md8YAiTo6Q7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EZHFO0HR0I541DEEPbD8dqDKvi+HdYFE0NVZs+fRLg=;
 b=kNHhJR+4F5H9lT0LfjNtrmi6nLTVy8yh63qQj8lnLWTM0fgGV4gUdYBo5+2I9xYiwrcYCK0V91SFnGVAPFFvGxY6bCKSWeL2fULNRUoYW1lwSslLt2sE63CMbUXd1rA5gxy8c5oB2Tpfmo1l6OCaGjYuTmLRVytMAKYU9LjUOHhKcMQ49uj2LfaQ+hb1Du9/r0F6RuvMBwldmXWs3vNgzZS1pReY+XnAP6K8wFEPRSc+42sxZ+qSXiN78KKbA0xLai90c+nt1xi6//+j1MLDQ6GWA0SV0r7bOpA+HzwBIaCOcaRy83QZZ6CkpLOrVkl29u5FaH3w+haabIYlpZDcrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, Peter Hilber
	<peter.hilber@opensynergy.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature
Thread-Index: AQHaMX1/hpjYjihwWEOrnIKfvD0zDrDirm2QgAamAQCABat9EIACRACAgAP974A=
Date: Thu, 1 Feb 2024 05:53:29 +0000
Message-ID:
 <PH0PR12MB5481E7A8617CD35F67360589DC432@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-4-peter.hilber@opensynergy.com>
 <DM8PR12MB5480022FDB88FBCEAA13E2C9DC772@DM8PR12MB5480.namprd12.prod.outlook.com>
 <aca3c781-3932-4cc1-aef4-f29fb1297b4a@opensynergy.com>
 <PH0PR12MB548136F408DA5F0CA8B2B0E8DC7F2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <874jewkrq2.fsf@redhat.com>
In-Reply-To: <874jewkrq2.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7602:EE_
x-ms-office365-filtering-correlation-id: 13211d10-6df4-4660-48d5-08dc22ea1d86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pzjsee+jmrfCXLKSRsbwEnYa10E+KDTuVUbwy/KirnvUsKS+hQTucl8L4E9lpIL0g6HeiVOH0NxI+F7PhoOjyAmS2Z9Kl4jrM07IIKZKFOhA68y2nrhL4kjgov7nx0S5U1RcT6GahmVYPMUU9GWSRYzfOoaNE9Z52W5KXI05pp2vMVwCuWY9aKXmJlzw1txbsUe/jh9hfEdYeczIaNvwtcbxENc327aZdNN7SZ/+SCEW5sX8E/DlbpRQz04WMWMD1lpUS/DMZKSAbE/nMXDvEOeCxePEGgeG1rOGM888R4Gq2nfRhJ0Ng40Eh4eLBiCMxc9/yO5bZYuYN3GUQ1Ld0rVt4Yip8ToSLx45WHoRio4QIFcuotQLEvNX1OaSSjTKg1cuUEvYh3XD6NnvdD4M8PaDDlhcvHGtEZAE71iqFeY79zgheqDOu27GihZdszCREpAJ1pErjyeMKe3NQxI6CTqFJwf1Nt5K7bd0mCBBnicbPIv0j3fBgArcRnRHP3/ZfCy02hHIu1YZt5bjZaT+w1Dv1uDOVW5JgBH8wUin+Vo9R/yxUvpJm4qbArfmN9XGyoHMXaWGAzbVKI/MV4q0HHGUdmwHKBPmQ5uvfHq1r7SogL8D+Rt/+TlyHSNB0z2B
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(83380400001)(26005)(38100700002)(9686003)(76116006)(52536014)(5660300002)(110136005)(8936002)(66446008)(64756008)(8676002)(66476007)(2906002)(6506007)(7696005)(53546011)(316002)(478600001)(66556008)(66946007)(41300700001)(71200400001)(122000001)(33656002)(38070700009)(86362001)(55016003)(66899024);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9ouqk3OZuevyvOWjaEKhILtKOM8+9JVcq6wC/k1XWo6n8mO5rO0O1Lx6kfcu?=
 =?us-ascii?Q?towN7IskOrXnlFosgOmkzIBVftRk6ZoPTdXwZyG0iA9ZoeHgzeH0SKM2hKWX?=
 =?us-ascii?Q?VW8exOhb5Cn0bw4W/hNB+teMIPwbqEAP9YgzLq8NFrpKKoVcoclC0jC9VhJ4?=
 =?us-ascii?Q?1ak7ku0GT1edTMx4bg7EPAL0NtXKfCkO3gQmoz2fa/uQCISwvOgJdkPQ6hwd?=
 =?us-ascii?Q?Yquz8LnDoVWy2ttsB6ys6h+8jCYrahbrieBqjpo55lAVGr8uMHAP0KI1li0A?=
 =?us-ascii?Q?cX+rMS62jdJvcc/Ui1CjqApOcvbzmmYW4dusZlKpsbRLQAIdTiHmNl9lwMLM?=
 =?us-ascii?Q?59ztHDisn3wyNf3ejhn5TU4yEcJwJiA3gURPo5Uq6SzYQm8UETuLIh/VIH2p?=
 =?us-ascii?Q?xN1l9IWYXZf7ufgzcaxEK4wLFKSMx/nquD5IPTnL+s65xTnWPd9TCOAxg/Wg?=
 =?us-ascii?Q?pRWTGePyo5TZs081SW9qbGtwf+AGEJKFOW9d3V0oSqVCZ+R0ofE2ApxRw/dx?=
 =?us-ascii?Q?8W/pzMe6RXxxmd4qVLrNApveaAinwWa3HvRtRSNRUOJxMCp1dxM1NBOlDowU?=
 =?us-ascii?Q?zALUOv5X0ix8BOCYEVmgsn2j3YJjk7noTziySYMcISCxGao37sTVhsGgE8rz?=
 =?us-ascii?Q?QRPAc+gl2HM1fYsKoiRV2s6NtVlv4xDw8OzkbEwRDLSefWrQYVUUyihW0TME?=
 =?us-ascii?Q?HZpvb5Q36EQnbTk6mye6QVzeFPa+tAA/OMwhsVOSEQAhnJ4Tnd97F/JLY3iG?=
 =?us-ascii?Q?mZx3bmwgkmcZM/Dnn2x7FFw8FmViDhdmss551UCyux3wDfuefa6G+RvoZQB0?=
 =?us-ascii?Q?ofeMXfVRT7w2yuF+ZgAv+2CO3Ws8/IhMkV5zgkYC7yoIdzfBbq/pPVGMQDjh?=
 =?us-ascii?Q?CC3KMi0jymXsTOF4sHfv2B2q21escfnFsbBBREh0XKCqFwT3letzrzE+MGK7?=
 =?us-ascii?Q?qB3ySCHa/tj8o+AAnMy/qZmDo6Hs4bSVpA4tTxbP/nUVdFjauZH7bz/cH0BV?=
 =?us-ascii?Q?ugKhe8NSiWSHcAe5LaMDkcdaucXxvwOnUNAqE6gfWKiM2NubvBhF06MBTjZW?=
 =?us-ascii?Q?YXNmuiIiwAWv3KFi6VEWiaTmF8F5YueUeWeMENsCV6Pln61OwjIUu7GGsA6q?=
 =?us-ascii?Q?07bMRzgHy4i39o39rQdE7/+Z6Asflwpgz264J5EbxwpibrlIDh0u+yHopsYc?=
 =?us-ascii?Q?Jw1fjU8zV3YAQUXbMQt7VeRnrvBC5fj1dxt4dk+96k8SugCmCvBO2VRlmjc5?=
 =?us-ascii?Q?fpM2Na1Fm0iVZOKmoxfrUyuD7Yxz4nigeNvjcd4c0OaqOHaGInpcMG+zmnSw?=
 =?us-ascii?Q?x00V1ChbyIHm3ML3sR5UFjg+Hbj+FgW3neSNtYPFwZze3N0xIRWPH3AY/t2i?=
 =?us-ascii?Q?+QTt5Pmji62hyGXI1hL03s1f3OoOKUuO0koLuIZSdH80j/G2s3lkiu8NlfFD?=
 =?us-ascii?Q?i29RwC5RBXyUiiirse91oYTDVU3RvmS9wfWtQHsi9a//UWVh1SKHte7Xgjnu?=
 =?us-ascii?Q?pELeTDtlTOUo7pf+DkxxA5IXdxlxe379A5pbEGHwydqbV0oWvSKdFLZmDiG1?=
 =?us-ascii?Q?WdTcshf6AzaX+mQZzGw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13211d10-6df4-4660-48d5-08dc22ea1d86
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 05:53:29.2433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1CdXW4Dm6pgipUuMZ0zjpoLCbmH0vk2Rj2Zx6cVDOH5iCBKC/o8Ng0fWnl3+D5UEpkZh1L3WlZcbo7Fcyx5r7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7602
Subject: [virtio-comment] RE: [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature



> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Monday, January 29, 2024 10:22 PM
>=20
> On Sun, Jan 28 2024, Parav Pandit <parav@nvidia.com> wrote:
>=20
> >> From: Peter Hilber <peter.hilber@opensynergy.com>
> >> Sent: Wednesday, January 24, 2024 9:11 PM
> >>
> >> On 20.01.24 11:16, Parav Pandit wrote:
> >> >
> >> >
> >> >> From: Peter Hilber <peter.hilber@opensynergy.com>
> >> >> Sent: Monday, December 18, 2023 12:13 PM @@ -13,13 +14,23 @@
> >> >> \subsection{Virtqueues}\label{sec:Device Types / RTC Device /
> >> >> Virtqueues}
> >> >>
> >> >>  \begin{description}
> >> >>  \item[0] requestq
> >> >> +\item[1] alarmq
> >> >>  \end{description}
> >> >>
> >> >>  The driver enqueues requests to the requestq.
> >> >>
> >> >> +Through the alarmq, the device notifies the driver about alarm
> >> >> +expirations. The alarmq exists only if VIRTIO_RTC_F_ALARM was
> >> >> +negotiated.
> >> >> +
> >> > I think is a good example of a need of notification queue from
> >> > device to
> >> driver that has multiple use as generic object.
> >> > On NIC side also we have been thinking to have VQ that holds only
> >> > the
> >> completions as currently packed and splitvq unaligned and shorter
> >> completions are performance reducing areas.
> >> >
> >> > A queue which has 1 to 8 physical addresses, and which can hold 8
> >> > to 64B
> >> of notification will be useful.
> >> > This way per descriptor posting and DMA is not needed.
> >> > These notifications also work very fast with least amount of
> >> > descriptor
> >> caching on the device.
> >> >
> >> > For alarms this may not be concern at all in current form but
> >> > overall, such a
> >> generic infra has multiple uses.
> >> > So, I suggest we bring the notification queue.
> >>
> >> IIUC this notification queue still needs to be described.
> >>
> > Yes.
> > What we need is something like,
> >
> > A notification queue is a queue that holds device to driver notificatio=
ns.
> > The device writes the notification entry, the driver consumes it.
> > Each notification entry consists of N bytes written by the device. Typi=
cally N
> bytes range from 8 to 64B.
> > Posting every descriptor of 16B for such small size entry is very ineff=
icient;
> hence a notification queue is simpler enough that does not have one to on=
e
> mapping of notification entry and descriptor.
> > A Notification descriptor points to a page memory. Each page holds one =
or
> more notification entries.
> > Number of notification entries in a descriptor =3D page_size /
> > notification entry size; For example, a notification queue consists of =
2 4K
> pages, with 16B notification entry, can receive 512 notifications, with o=
nly
> two descriptors posting, offering 256X reduction in descriptors managemen=
t
> at just 0.39% descriptor table size than current packed vq format.
>=20
> This looks not entirely unlike ccw two-stage-indicators (which is in turn
> preceded by other uses of adapter interrupts with indicators, e.g. in QDI=
O).
> Can we learn from those earlier implementations?
>=20
There are many implementations to learn from.
Not sure of your exact suggestion.

> However, while this looks like an interesting addition, I'm not sure we s=
hould
> make rtc wait for all of that (including your other suggestions) to be re=
ady
> and approved -- a simpler rtc implementation has its advantages as well (=
like
> already being there, for example.) We can easily add things via feature b=
its
> later.

Alarm is the new feature posted for the first time if I recollect right, no=
tification queue is for the alarm.
So the simple rtc without alarm using admin infrastructure can be part of t=
he spec at earliest.

I am fine with "already being there" suggestion too, if we are ok to apply =
to wider areas than rtc.
Do you agree?


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

