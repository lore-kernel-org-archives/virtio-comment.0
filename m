Return-Path: <virtio-comment-return-8982-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4232BC47DB7
	for <virtio-comment@archiver.kernel.org>; Sat, 20 Jan 2024 10:16:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 99E7F2AF8D
	for <virtio-comment@archiver.kernel.org>; Sat, 20 Jan 2024 10:16:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 700309867B6
	for <virtio-comment@archiver.kernel.org>; Sat, 20 Jan 2024 10:16:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 52F4F9867B4; Sat, 20 Jan 2024 10:16:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4393C9867B5
	for <virtio-comment@lists.oasis-open.org>; Sat, 20 Jan 2024 10:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQmz+GzEJ5ZJTorgQGUz127RzUvpF6V8EewWHxBL1Z0X9huojLZ/2y4YSmfann12axkREjl0/ZSWHaZbewZ6JvLND3f33wRkNpk/Vf2PU8v8jWaLzvCWsXuIWFhEIpGciTaBEWs0B8KevhYgShCbyac689gurEtzkkzlpmM7hxwumjI33bSxnZunDYA16GC03SqMwHbdS1hnxMuzdmRORo86y1+ShdUu1wMdujG2cqXi2Gerw3WlKr4mgONFhFNTa3qoX0nbb+fjDV9Mda953GiPDCYzUV1UuEokbiyJWf19PvYfmdg6Y6GhhMG/WunWqYuzQpZFydao2daJmepMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZPH3BP9d2EenMcJfunVwUkQgB/Ds4A1mz5WL7aYDds=;
 b=EaVxaDoeA5kVqQAfzPDQFoGcE0nLMT016iGUqIhXPH8rgyxw5Udl7uJ+cEE/ym+w8/NG2rliHU0Fl903icpTEzI8VozzIUcTpObtlP/b8CHfqXRPE4TdMjySB0sT5eOE1T5VdqbMerILICC4vBPK+z32HSaZS1LiFy2Jh7f0WLbYZfudpfEgiD+W1039D48JaT6RdtHeHf6873r0Tjl41tguSaGkkeW7jPVuytmuMaT1wxn7GTMPBNEtGieeLa24Vh35u9eWSxXVv2Ghs/fJC/f9+JOMuEHcpqEzVdu4d4wYoWJE1lcIO4EyT89bQv/0naJonQ5rdzTjAY8iiiVQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Peter Hilber <peter.hilber@opensynergy.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: Cornelia Huck <cohuck@redhat.com>
Thread-Topic: [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature
Thread-Index: AQHaMX1/hpjYjihwWEOrnIKfvD0zDrDirm2Q
Date: Sat, 20 Jan 2024 10:16:12 +0000
Message-ID:
 <DM8PR12MB5480022FDB88FBCEAA13E2C9DC772@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-4-peter.hilber@opensynergy.com>
In-Reply-To: <20231218064253.9734-4-peter.hilber@opensynergy.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|SA1PR12MB8698:EE_
x-ms-office365-filtering-correlation-id: 45895874-a595-4e91-4f2d-08dc19a0d470
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DI/0iibk8ZTCLPYm6xYeuaklNHYVg+9Pij0yn7xNIdsnhRm1JEq3q0E5Efa/qzhmRwm6xWOqS51ncnHxslDJoM1VfJ07gfUuUEkjGTno9En+yT/4lGdEg5WmEyTe6iLfRjBwpGbi3gbtp2wIvc3oQJ5LsBsKC0e33UBI55xdrTlKARg/wD8L/FjPkFInPc4uznnypuL1WzBmr/Mbu80bRYrLFqyjQJECaAI3A0h0Cf/lSbGNh0yEwEwhmT4WZHA0/1GUnp2adPNtuMS5TugvPhKYjFOy8FEqPYsbE5tCzsBj3vlfcAyg5JuN5PTtutrFGxJodJ8mkEeh5OCpUEgUyO+HlNtlWzSe0JgpKz1qzTpVk2h/dBMFxQF15dMp6tUaFnH4AHXKrl35z7umJUY3Eta74jYN6Eg0Z/iWhtV65oKgqehkJZZPYyVEQCNpu5OfPFSfkQt1hsjixamI1xxsxTaEiu0IEZwiT8qr8HYfGvw/PK9Q9131DmHvPn/BZuGihO90l6y2GebRZJcNfR50MhxA9xEXRsYRIfIN5yXdaoX6iAKSGyyJJYRzl01Ij5SMxIlvTDawWZrIN0tVy6+8jgCjSlm3AlEE1/JS2vYC/HfIbY6Z2r/Nm7dPuT1asB/Z
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(39860400002)(346002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(9686003)(6506007)(7696005)(26005)(83380400001)(41300700001)(52536014)(4326008)(8676002)(316002)(8936002)(86362001)(76116006)(5660300002)(33656002)(64756008)(2906002)(66446008)(66556008)(66476007)(110136005)(38070700009)(66946007)(71200400001)(478600001)(55016003)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MEpBLqMFlBSJ8/3Jk3YW1j789a+4NSqWe6SQF4hJN8WCizuUymfzCktuaYpO?=
 =?us-ascii?Q?jtotr72ZtxlP/8dfzNzBhOgCYJFVcEl3brsHU953c8YFnJTXnxwTL17MHpNW?=
 =?us-ascii?Q?8178jx8gfTf6ARWyoh+zsokBArGhW9PpJsxbY98+SwuNIx5l6GlWJxQq46vb?=
 =?us-ascii?Q?PPx7WUUaQOqQQ2wTxbSWEteVkR1kbP+2SfcAAI6iex3WY3RupcfygL5fHJVk?=
 =?us-ascii?Q?BpaKXLuopfqlB4uFWa1ACfDGjIkgKwPaVNIW1pcFCwQNhxk+zOn+DN5+RWD7?=
 =?us-ascii?Q?ilAEOWQrxEDOdjsgEbD2rskBPKVj5lY9Ek/OTQID8m0X3EHsK2e5L7eC340Q?=
 =?us-ascii?Q?0d77yyMJqeopM5ZmuRKP7lgeqtp9XIfIXsvnZXAsSMQhPzzSOFm+QRHWM5eg?=
 =?us-ascii?Q?9bL37wuHyp3peTe8fVpVwVyTRoQMRjx1KgK9A7Z6s27YVUOlbu9pWI0/wwYl?=
 =?us-ascii?Q?b5FxdDLr6OCBzLMfMDIIt+F/tiEienhgSVc45LS90nfxfcGaAji7/qeErp9y?=
 =?us-ascii?Q?dJcpW0DJhrG19WAdK+f/CDXDs5df8oCKX9bB/FTvlZffSI404EdejPUKXzuE?=
 =?us-ascii?Q?TLXxX5yx9MpekozqzJvr39YE9u/CA/+umO4zIWfbUoiNNP7zocwbb3eWc5Qw?=
 =?us-ascii?Q?EA2o6HUIi3Z+/NE/OImDKKaAmvuBRbf7YEzXmbKvRa+xbulaD0z7GRJ5g8FS?=
 =?us-ascii?Q?832jX+a8B6GHIxEaj46MfHFp1o7YGUYodUMnNknET4i+k+qfT/4DS7sKDZ1Q?=
 =?us-ascii?Q?fHnKjyR6EvDclazsQ3Xpbe9gA4aUTSQt63p5/svi7miFaToQhZv7ER6D+hl8?=
 =?us-ascii?Q?N61DKravBlr555YjT3rLfeVBrSFYY8iuvhgaRWg7odCSqtRblJkrMeRImBD0?=
 =?us-ascii?Q?RROjDAAby4qTB69x63GNaPTfnK9rMCe9pvkGzpaoxyXjFcjyhObVPndzhi1u?=
 =?us-ascii?Q?81KK8yprXVk+Q42yMhXg7WZLNHiZ53HBehIXHFxkxRNyJqun6nh2N9MYQCZk?=
 =?us-ascii?Q?RJA5/SDHoGmaZHBo5MK0nVOEozkTUKI01F1W1UR0mt+YJEoLWY1hR5iGSL7M?=
 =?us-ascii?Q?bop9qI2nfzGNi0lqZWvZCNaUrndLqtkJyuk4B2Kj5L1XLylZMOv+iNbxa5de?=
 =?us-ascii?Q?qx/PNJcvrBpV9kQjm5G1ubA4iouWP0tRMNaXTeUSivVPpQmo0fDs76Iq+H+m?=
 =?us-ascii?Q?O4MsUJLhHGu5Qd4BSjYfyc4iUYryFC3f+ybwd76Ke5g7JEnfsUgZCArWHE+C?=
 =?us-ascii?Q?oiBECCgiIs9pQh1aW6zx7OkID9ii/xnje0jJXkCL2wO7Ul5Dgbho8jXjJJkx?=
 =?us-ascii?Q?gQQUEJPq30m4bjKpbUTY+e98C0yAvttgHZfjS3xhbzULEgRlkDYyADJ06T8q?=
 =?us-ascii?Q?oaqkeKbh30dImEeidA1LwTYf9ZE6lTPANv5bpLBjKcRwLrBFibTPkhKvyDPc?=
 =?us-ascii?Q?D60d0pjQyUwHQAXD71N8mm1kIqK/qI7wf7Qker8sI6sX0io7jiwnJMvs/QGa?=
 =?us-ascii?Q?E0HrWA0bhJJ9QwUpgDivfRM+uKjY1Y9ELi4SEeg5jDm6O5AAWpTRNfB2124u?=
 =?us-ascii?Q?1jmHO90kyQ6S3KyxOuU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45895874-a595-4e91-4f2d-08dc19a0d470
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2024 10:16:12.8920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r2FfUwGQ2JaqqitKAlOafe9uduPqtwiEdRRy1BG1oxwOeY5S2dadQgnSr/Hme0rivjSfjABGRbQ3LpQPPyqbnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8698
Subject: [virtio-comment] RE: [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature



> From: Peter Hilber <peter.hilber@opensynergy.com>
> Sent: Monday, December 18, 2023 12:13 PM
>=20
> Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
>=20
> The intended use case is: A driver needs to react when an alarm time has
> been reached, but the driver may be in a sleep state or powered off at al=
arm
> time. The alarm feature can resume and notify the driver in this case. Al=
arms
> may be retained across device resets (including reset on boot).
>=20
> Peculiarities
> -------------
>=20
> Unlike usual alarm clocks, a virtio-rtc alarm-capable clock may step
> autonomously at any time: An alarm may change back from "expired" to "not
> expired" before the driver has started processing an alarm notification.
>=20
> To address the above, and the device resets, define "alarm expiration"
> in such a way that the driver always has a chance to react to an alarm, a=
nd
> make the device always responsible for notifying the driver about an alar=
m
> expiration.
>=20
> The VIRTIO_RTC_REQ_SET_ALARM_ENABLED request is there so that the
> Linux ioctls RTC_AIE_ON and RTC_AIE_OFF only need to emit one request.
>=20
> Open Questions
> --------------
>=20
> - A Linux driver could use the virtio-rtc real-time alarm, through the
>   Linux RTC device class, for both CLOCK_REALTIME_ALARM and (monotonic)
>   CLOCK_BOOTTIME_ALARM alarms. But then, after a clock step, a
>   CLOCK_BOOTTIME_ALARM alarm may be late (or early). Perhaps this can be
>   handled by the driver also setting a virtio-rtc monotonic alarm, so
>   may not need to be addressed by the spec.
>=20
> - A request returning the minimum and maximum allowed alarm time might
>   still be added.
>=20
> Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
> ---
>  device-types/rtc/description.tex | 256 ++++++++++++++++++++++++++++++-
>  1 file changed, 254 insertions(+), 2 deletions(-)
>=20
> diff --git a/device-types/rtc/description.tex b/device-types/rtc/descript=
ion.tex
> index 7707472f1663..fcd2f14186e6 100644
> --- a/device-types/rtc/description.tex
> +++ b/device-types/rtc/description.tex
> @@ -4,6 +4,7 @@ \section{RTC Device}\label{sec:Device Types / RTC Device}
> time. The device can provide different clocks, e.g.\ for the UTC or TAI  =
time
> standards, or for physical time elapsed since some past epoch. The  drive=
r can
> read the clocks with simple or more accurate methods.
> +Optionally, the driver can set an alarm.
>=20
>  \subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
>=20
> @@ -13,13 +14,23 @@ \subsection{Virtqueues}\label{sec:Device Types / RTC
> Device / Virtqueues}
>=20
>  \begin{description}
>  \item[0] requestq
> +\item[1] alarmq
>  \end{description}
>=20
>  The driver enqueues requests to the requestq.
>=20
> +Through the alarmq, the device notifies the driver about alarm
> +expirations. The alarmq exists only if VIRTIO_RTC_F_ALARM was
> +negotiated.
> +
I think is a good example of a need of notification queue from device to dr=
iver that has multiple use as generic object.
On NIC side also we have been thinking to have VQ that holds only the compl=
etions as currently packed and splitvq unaligned and shorter completions ar=
e performance reducing areas.

A queue which has 1 to 8 physical addresses, and which can hold 8 to 64B of=
 notification will be useful.
This way per descriptor posting and DMA is not needed.
These notifications also work very fast with least amount of descriptor cac=
hing on the device.

For alarms this may not be concern at all in current form but overall, such=
 a generic infra has multiple uses.
So, I suggest we bring the notification queue.

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

