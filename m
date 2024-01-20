Return-Path: <virtio-comment-return-8981-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B04C47258
	for <virtio-comment@archiver.kernel.org>; Sat, 20 Jan 2024 10:07:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 643A82AF8E
	for <virtio-comment@archiver.kernel.org>; Sat, 20 Jan 2024 10:07:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 409939867C0
	for <virtio-comment@archiver.kernel.org>; Sat, 20 Jan 2024 10:07:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1F3079867B4; Sat, 20 Jan 2024 10:07:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F9969867B5
	for <virtio-comment@lists.oasis-open.org>; Sat, 20 Jan 2024 10:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THbhRbFMVY3WEdeNHVkKptPUv/JF+cZJy494v0FqO0jbttkSAQEObj+hdHS0Xlam/a1+tfF26REDdxUi6YH54a1XPbBRwPO2xIBMiaKER+TM1VTN6YOhwFtBmlUP92QHe8y0Nqicqp1nfTO6Ut2/+HhXHOouF5h0cZSB5v9Qa+xQWv4u6XxeeLPYH2qWN2DbwqR7bwec1B/kJrFH0J/9qfw6Wb/HcbjMnkSm3KiCZmeAxr4azlUvGjngNpz8AGN+0d1JTzEfSImWUwSu4jCFi7Iu2DDWwWh2dxyhT3Yh9PXk3tlR7VbwX3foW40u/rJ0lcJiEjNmhm0FIgTcH5Q5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2vhM2Ep1hbHLpx5h2wTOl33zvrs52VhraBs3zjuQa8=;
 b=K1/PGyir7pboKZBxiAUrWc3lpid95rG0I8nWcpuL9NpQmxPdxzBDqoiB7OpXocU6el+AzA22pdmXULEF2ay/OB9X46rdHtd/z9XddJ9YJBizINMa0W7jir7R2u/SKMXHZZQFwbSpF/ti8bECoNAfVD01UHSP/TUzcKav4OtVqG941FGPlvz/q2w49TwqdTFvc1WLurHtbHhC/SLSG9dpWq2rRV1+GdyqJzZCnYxoiNnDvQaIw2c475tXXsOKRbwqOnxruOFCJvjxpvhAgzo5agrDOoj/MrHMRzbGuDyrpdYoUyYxtlxpefumHmGyWbEymaIQHuTJKMhanh0V77McQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Peter Hilber <peter.hilber@opensynergy.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: Cornelia Huck <cohuck@redhat.com>
Thread-Topic: [RFC PATCH v3 1/4] virtio-rtc: Add initial device specification
Thread-Index: AQHaMX2A+oPu50iAtkGxjkjxQ3EfYbDiq7tg
Date: Sat, 20 Jan 2024 10:07:07 +0000
Message-ID:
 <DM8PR12MB548058D48443B3B0A89DF05DDC772@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-2-peter.hilber@opensynergy.com>
In-Reply-To: <20231218064253.9734-2-peter.hilber@opensynergy.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|SA1PR12MB5616:EE_
x-ms-office365-filtering-correlation-id: 636b420e-ac0f-43d0-8e3f-08dc199f8f2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ezTl9qYTk+ax5PUkSEeqqiM6MWhYtQkpQMtgDo3jtMpdXUIAGL938Wrg3+kvPaemPvQFFzrEwvsf0m4RDl9ZZxE17EIUFMzCAnTqmtYFPtD+GFOdL/I5FeyrPOt7n4kUEkouy7A9+k8nBeTy3YV2Sbd+gEqJsyMc2CfnxVPip4vgIMBDtFQrGpFZIGdIArv1Jy5QmrpgzDi/cbrvFNmdSYy1mtrvZPDHGkBRp7vYlZC6FAIX4wL3WemF0xSU52IjTfAnEcZpGPmcT8MBNJli/08SPFoQ6Q7DRXmwwstFPLPWPAoFTjlB2SY3FxhMkLEup9fP2iHH1M/fyICJLwrBV+JOTeOK6s4BewBBP2icWkZ2YfQeZRfgf8/rkJLtu6Xpp8BiL1CsQ+qrsmFfU5bVxw9A3g033HOFOCfYglEocx8cU+WQpcX/XEyVfP8uVxTLpJwAgTNaBW57+KErBRGp1fcmv/FYk8SUN+wlVczCQBTOTja4xDnXmerv42DNZLVKVw97nsN9xj0TLqMoRvLR+0VrlzzJmzn/OEq65ACykn51otVPxZyqt25lz2xsFu75DXinaABnKk4upslWSEeS+hAr5NPJ/5G3C+R/wzKqDKUHO6BIS/nlRjiJrbX75suNicDOFZ6h5rV9F5AmWBOpVXrbOBNiuFVZzdSPZ2LeTQJdEyrQDSmt2VTUkOYLlWKdb3eLwtJkIA+SEuuacESOcw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(26005)(316002)(110136005)(2906002)(38100700002)(71200400001)(8676002)(9686003)(64756008)(66476007)(52536014)(966005)(66446008)(8936002)(30864003)(66556008)(478600001)(76116006)(66946007)(41300700001)(4326008)(5660300002)(86362001)(122000001)(33656002)(6506007)(38070700009)(7696005)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?F2zHMDs6t6CMDvCYkd/XpG1JvrCCcsQC6g6YO+PTw5diQpVUC/GQHmDxb1S9?=
 =?us-ascii?Q?bYYg5SKhyH7IDLISNyNU0IieyUbfirwwpry1nZJtfP3ov+n7IeZ0l9ylW7B8?=
 =?us-ascii?Q?RVpFAgPVTJa29ecK/PgDMTPfc34EShq2sI62j5OimzSB3EGW65DyLAUBRyTK?=
 =?us-ascii?Q?qoes1Th1Ai0ZdmHg2GDNzWdJqVRf5vZJ542bru7RTGbjSY0Gwsc+2RVI7ISA?=
 =?us-ascii?Q?tE6+6Rm0F897hTT7bRydvLztgX+xsFwwNT0FlQgCcoIKEnqa5aWxsFMEMTb3?=
 =?us-ascii?Q?gUtcdXWjNthoqLY91/zOYa1XW2BZTxuYwoAsfbiinQ7S5s2dA4HXw41idYyb?=
 =?us-ascii?Q?3NP2zHxvDGN5x1sPnS7eCAm1rUxNeFHjn1ceoDaMFUIRbU1ZQYvlu5QPbvat?=
 =?us-ascii?Q?jdUsGCZ9PHTEn3B8qpckIUFP70LsUs8mxIjED+RK+hRJ6n09It0pAQvQVuOb?=
 =?us-ascii?Q?2m9WZA2zNuibxh19fNY27sOmTSXUngMOH3PuC3IZHKiCnUHU4p2faMqyYarP?=
 =?us-ascii?Q?MzQvN3FwNqQXk00JNLPF0yLH/DSwBwU2zyLlr6jRycxhJXpsFIJ5JEljxvg1?=
 =?us-ascii?Q?NYMQeNl3mUD7qRu+ujE5Piw+gdpC7626r8ihdAJio1GTfqhYo5N5OZcj/fY8?=
 =?us-ascii?Q?1BZo0fcy7PF9rGKijjiM/XcIVqr4S6hWV5aSi2q5CLwp0eiweHHSi4F6sm0W?=
 =?us-ascii?Q?i3Q3m03EzAMeaYr8YGsxSVCGpzrPpkiVTP3AFX169rDZ8N5DIHXBoGOqAdzP?=
 =?us-ascii?Q?0gha+ZFC9enRKG7UPJGeJHTUpWx1Od/VtigOe7YROUNrpCMZTYvFvDEMVHyb?=
 =?us-ascii?Q?WXM7sy9H8PcdC3J95yd8oCbHHI2Qa4J0TzFgKssOvQJ1Ck/6dBVrOT3c1FxE?=
 =?us-ascii?Q?tGiSR+CRziA0pQ6C9bwV02f6Wu3d1rYFIKQOv/WtdIkySJS/skvQmNznbP5a?=
 =?us-ascii?Q?pVFq+D81t+BLaOsR2f5vPXE/fe1XFJ1vWA41SweAaeSbPPrNoVAWFAu+rdVZ?=
 =?us-ascii?Q?kNwMc+lP5v+oLheZFjnR8ww18omr15UIqfhxq+NJ721/51a/Olqn6E442hDn?=
 =?us-ascii?Q?X1C94tQiNb4Q7+iIzXZbWT2VHJwqLKr+xROMHJNCdSOXvrWSPO4DO5ZmNpCJ?=
 =?us-ascii?Q?0iADUrIUstgYZ4F8H4Hjg8qBJyjKsKkE+wQ3mfqk3hegPHnu7wkDwsfocJFq?=
 =?us-ascii?Q?McEOeBY2MbiDDIhv4JIhBgrNIjV/FAPBuKoi2IFcemRw4kU42AOYhrM7G9eY?=
 =?us-ascii?Q?/lnTdf9BZ/WVRIpR2FQ1w35KkQIsxnvSbxEywKy77geF+Dsd2ID8H3kEo9o0?=
 =?us-ascii?Q?1DQTssSEVvDk+b1vhZo8MNy2zB2vg/WD0e5ahMvFykhJpTQuNb+o/ZMboQ2P?=
 =?us-ascii?Q?gy8iOAnrjaF6+W8muY+j4tRp2XlsM29bRN5BxJairmUA34ZVPy/a4/DC7KSt?=
 =?us-ascii?Q?U+uxM7sm9b+VikRBIaIuZX8aDb7jQL1wZfCjWfoBnDMbzq3Q0EOC5zJ5ukQw?=
 =?us-ascii?Q?20YjekgtidKc/TD3CVf1K0++UDqQjf7+H9UHEPxAvPcPvcmrTp5j5fIkEo3O?=
 =?us-ascii?Q?xH3yVURNF5Fm7UecVFg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636b420e-ac0f-43d0-8e3f-08dc199f8f2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2024 10:07:07.2238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t9h1+mGAo7Wj3XGPL7jG2Ygwunmi+Hvnhf9ObIIq2OSmTLJQERummoLd5cGYAHNa8DtiQlDPhJjZ8E2qbdSVnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5616
Subject: [virtio-comment] RE: [RFC PATCH v3 1/4] virtio-rtc: Add initial device specification

Hi Peter,

> From: Peter Hilber <peter.hilber@opensynergy.com>
> Sent: Monday, December 18, 2023 12:13 PM
>=20
> This is a draft for a Real-Time Clock (RTC) device. The virtio-rtc device
> provides information about current time through one or more clocks.
>=20
> The normative statements for this device follow in the next patch.
>=20
> For this device, there is an RFC Linux kernel driver which is being
> upstreamed, and a proprietary device implementation.
>=20
> Open Questions
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Arm Generic Timer Clock Types
> -----------------------------
>=20
> This spec version still distinguishes the Arm Generic Timer virtual and
> physical counters:
>=20
> 	/* Arm Generic Timer CNTVCT_EL0, Counter-timer Virtual Count
> register */
> 	#define VIRTIO_RTC_COUNTER_ARM_VIRT 0
> 	/* Arm Generic Timer CNTPCT_EL0, Counter-timer Physical Count
> register */
> 	#define VIRTIO_RTC_COUNTER_ARM_PHYS 1
>=20
> But there might be no benefit distinguishing them, as per a discussion on=
 the
> RFC Linux kernel driver [4].
>=20
> So unless somebody identifies some use in distinguishing Arm virtual and
> physical counters, this distinction will be dropped in v4.
>=20
> virtio-rtc Functionality for Net Device
> ---------------------------------------
>=20
> There is interest into sharing virtio-rtc functionality with the virtio-n=
et device
> [6]. It is proposed to encapsulate the requests resp.
> responses in the pseudo-fields command-specific-data resp.
> command-specific-result.
>=20
> This handles natural alignment of the payload in a way which is compatibl=
e
> with
>=20
> - existing virtio-net controlq commands, and
>=20
> - with the standalone virtio-rtc messages.
>=20
> Additional Information
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The spec does not specify how a driver should interpret clock readings, e=
sp.
> also not how to perform clock synchronization.
>=20
> The draft uses the "Timer/Clock" device id which is already part of the
> specification. This device id was registered a long time ago and should b=
e
> unused according to the author's information. The name "RTC" was
> determined to be the best for a device which focuses on current time, but=
 is
> up to discussion.
>=20
> Any feedback is appreciated very much.
>=20
> Changelog
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> v3:
>=20
> - Address comments from Parav Pandit.
> - Split off normative requirements into a second commit [2].
> - Merge readq and controlq into requestq [3].
> - Don't guard cross-timestamping with feature bit [3].
> - Pad request headers to 64 bit [2].
> - Rename Virtio status codes to match UNIX error names [2].
> - Avoid Virtio status code clashes with net controlq ack values.
> - Reword to refer more to "requests", rather than "messages" [2].
> - Rephrase some sentences [2].
> - Use integer data types without "__" prefixes [2].
> - Reduce clock id width to 16 bits [5].
> - Make VIRTIO_RTC_FLAG_CROSS_CAP a bit mask rather than a bit index.
>=20
> v2:
>=20
> - Address comments from Cornelia Huck.
> - Add VIRTIO_RTC_M_CROSS_CAP message [1].
> - Fix various minor issues and improve wording [1].
> - Add several clarifications regarding device error statuses.
>=20
> [1] https://lists.oasis-open.org/archives/virtio-
> comment/202304/msg00523.html
> [2] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-
> b90aa4e50836@opensynergy.com/t/#mffb93800fea11d6dda9e151078abedd
> 6ff1c0f1e
> [3] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-
> b90aa4e50836@opensynergy.com/t/#m94efd0aa9b9c2b96a246b79ef8bfc3bf
> 64ebe791
> [4] https://lore.kernel.org/lkml/20230630171052.985577-1-
> peter.hilber@opensynergy.com/T/#m65fa1d715933360498c4e33d7225e4220
> 215a9d6
> [5] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-
> b90aa4e50836@opensynergy.com/t/#mf00ce330228c28556d735eb9597469
> 048c5d8b62
> [6] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-
> b90aa4e50836@opensynergy.com/t/#mf00ce330228c28556d735eb9597469
> 048c5d8b62
>=20
> Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
> ---
>  content.tex                      |   3 +-
>  device-types/rtc/description.tex | 328 +++++++++++++++++++++++++++++++
>  2 files changed, 330 insertions(+), 1 deletion(-)  create mode 100644 de=
vice-
> types/rtc/description.tex
>=20
> diff --git a/content.tex b/content.tex
> index 98b9c319a666..f2b534ce97e6 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -683,7 +683,7 @@ \chapter{Device Types}\label{sec:Device Types}
> \hline
>  16         &   GPU device       \\
>  \hline
> -17         &   Timer/Clock device \\
> +17         &   RTC (Timer/Clock) device \\
>  \hline
>  18         &   Input device \\
>  \hline
> @@ -769,6 +769,7 @@ \chapter{Device Types}\label{sec:Device Types}
> \input{device-types/scmi/description.tex}
>  \input{device-types/gpio/description.tex}
>  \input{device-types/pmem/description.tex}
> +\input{device-types/rtc/description.tex}
>=20
>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>=20
> diff --git a/device-types/rtc/description.tex b/device-types/rtc/descript=
ion.tex
> new file mode 100644
> index 000000000000..abfa2206894e
> --- /dev/null
> +++ b/device-types/rtc/description.tex
> @@ -0,0 +1,328 @@
> +\section{RTC Device}\label{sec:Device Types / RTC Device}
> +
> +The RTC (Real Time Clock) device provides information about current
> +time. The device can provide different clocks, e.g.\ for the UTC or TAI
> +time standards, or for physical time elapsed since some past epoch. The
> +driver can read the clocks with simple or more accurate methods.
> +
> +\subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
> +
> +17
> +
> +\subsection{Virtqueues}\label{sec:Device Types / RTC Device /
> +Virtqueues}
> +
> +\begin{description}
> +\item[0] requestq
> +\end{description}
> +
> +The driver enqueues requests to the requestq.
> +
> +\subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature
> +bits}
> +
> +No device-specific feature bits are defined yet.
> +
> +\subsection{Device configuration layout}\label{sec:Device Types / RTC
> +Device / Device configuration layout}
> +
> +There is no configuration data for the device.
> +
> +\subsection{Device Initialization}\label{sec:Device Types / RTC Device
> +/ Device Initialization}
> +
> +The device determines the set of clocks. The device can provide zero or
> +more clocks.
> +
Now that we bring the generic basic facilities to define device capabilitie=
s and resources in [1],
Num_clocks can be structured a clock resources.

Please refer to max_limits in [1] as capabilities.
[1] https://lists.oasis-open.org/archives/virtio-comment/202401/msg00095.ht=
ml

We should bring a rtc capabilities.

> +\subsection{Device Operation}\label{sec:Device Types / RTC Device /
> +Device Operation}
> +
> +For the requestq, the driver sends a message with a request, and
> +receives the response in the device-writable part of the message. The
> +requestq uses common request and response headers.
> +
Now without defining any rtc specific structure, we benefit from generic st=
ructure.
Only two things needed.
1. define cap identifier
2. define cap structure

> +\begin{lstlisting}
> +/* common request header */
> +struct virtio_rtc_req_head {
> +	le16 msg_type;
> +	u8 reserved[6];
> +};
> +
> +/* common response header */
> +struct virtio_rtc_resp_head {
> +	u8 status;
> +	u8 reserved[7];
> +};
> +\end{lstlisting}
> +
> +The \field{msg_type} field identifies the message type.
> +
> +The \field{status} field indicates whether the device successfully
> +executed the request. The device sets the \field{status} field to one
> +of the following values:
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_S_OK 0
> +#define VIRTIO_RTC_S_EOPNOTSUPP 2
> +#define VIRTIO_RTC_S_ENODEV 3
> +#define VIRTIO_RTC_S_EINVAL 4
> +#define VIRTIO_RTC_S_EIO 5
> +\end{lstlisting}
> +
> +VIRTIO_RTC_S_OK indicates that the device successfully executed the
> +request.
> +
> +If \field{status} is not VIRTIO_RTC_S_OK, the value of other response
> +fields is undefined.
> +
> +VIRTIO_RTC_S_EOPNOTSUPP indicates that the device could not execute
> the
> +specific request due to an implementation limitation. The device also
> +returns status VIRTIO_RTC_S_EOPNOTSUPP for requests with unknown
> values
> +in the fields \field{msg_type} or \field{hw_counter}.
> +
> +VIRTIO_RTC_S_ENODEV indicates that the \field{clock_id} field value
> +supplied with the request does not identify a clock.
> +
> +VIRTIO_RTC_S_EINVAL indicates that
> +
> +\begin{itemize}
> +\item the driver request values are not allowed by the specification or
> +\item the device read-only part of the message, or device write-only
> +	part of the message, is too small.
> +\end{itemize}
> +
> +VIRTIO_RTC_S_EIO indicates that the device did not execute the request
> +due to an error which was not caused by invalid input from the driver.
> +
> +All \field{reserved} fields are written as zero, and their value is
> +ignored.
> +
> +The set of clocks does not change after feature negotiation completion,
> +until device reset. The set of clocks should not change on device reset
> +either (similar to negotiated features). Clock identifiers are
> +zero-based, dense indices. All fields named \field{clock_id} contain
> +clock identifiers.
> +
> +\subsubsection{Control Requests}\label{sec:Device Types / RTC Device /
> +Device Operation / Control Requests}
> +
> +Through \emph{control requests}, the driver requests information about
> +the device capabilities. The driver enqueues control requests in the
> +requestq.
> +
> +\begin{description}
> +
> +\item[VIRTIO_RTC_REQ_CFG] discovers the number of clocks.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_CFG 0x1000 /* message type */
> +
> +struct virtio_rtc_req_cfg {
> +	struct virtio_rtc_req_head head;
> +	/* no request params */
> +};
> +
> +struct virtio_rtc_resp_cfg {
> +	struct virtio_rtc_resp_head head;
> +	le16 num_clocks;
> +	u8 reserved[6];
> +};
> +\end{lstlisting}
> +
> +Field \field{num_clocks} contains the number of clocks. A device
> +provides zero or more clocks. Valid clock ids are those smaller than
> +\field{num_clocks}.
> +
> +\item[VIRTIO_RTC_REQ_CLOCK_CAP] discovers the capabilities of the clock
> +identified by the \field{clock_id} field.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_CLOCK_CAP 0x1001 /* message type */
> +
Each clock identified by unique resource (clock) identifier and this resour=
ce now has the attributes of time.

> +struct virtio_rtc_req_clock_cap {
> +	struct virtio_rtc_req_head head;
> +	le16 clock_id;
> +	u8 reserved[6];
> +};
> +
> +struct virtio_rtc_resp_clock_cap {
> +	struct virtio_rtc_resp_head head;
> +	le16 type;
> +	u8 reserved[6];
> +};
> +\end{lstlisting}
> +
> +The \field{type} field identifies the clock type. A device provides
> +zero or more clocks for a clock type. The following clock types are
> +defined:
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_CLOCK_UTC 0
> +#define VIRTIO_RTC_CLOCK_TAI 1
> +#define VIRTIO_RTC_CLOCK_MONO 2
> +\end{lstlisting}
> +
> +VIRTIO_RTC_CLOCK_UTC uses the UTC (Coordinated Universal Time) time
> +standard. The device uses the time epoch of January 1, 1970, 00:00 UTC.
> +This is the same epoch as \emph{Unix time}.
> +
> +VIRTIO_RTC_CLOCK_TAI uses the TAI (International Atomic Time) time
> +standard. The device uses the time epoch of January 1, 1970, 00:00 TAI.
> +
> +VIRTIO_RTC_CLOCK_MONO uses monotonic physical time (SI seconds
> +subdivisions) since some unspecified epoch. The
> VIRTIO_RTC_CLOCK_MONO
> +epoch is before or during device reset.
> +
> +Additional clock types may be standardized in the future.
> +Implementation-specific clock type definitions are not recommended and
> +use a clock type id greater than or equal to 0xF000.
> +
> +\item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device
> supports
> +cross-timestamping for a particular pair of clock and hardware counter.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_CROSS_CAP 0x1002 /* message type */
> +
> +struct virtio_rtc_req_cross_cap {
> +	struct virtio_rtc_req_head head;
> +	le16 clock_id;
> +	le16 hw_counter;
> +	u8 reserved[4];
> +};
> +
> +#define VIRTIO_RTC_FLAG_CROSS_CAP (1 << 0)
> +
> +struct virtio_rtc_resp_cross_cap {
> +	struct virtio_rtc_resp_head head;
> +	u8 flags;
> +	u8 reserved[7];
> +};
> +\end{lstlisting}
> +
> +The \field{clock_id} field identifies the clock, and the
> +\field{hw_counter} field identifies the hardware counter, for which
> +cross-timestamp support is probed. The device sets flag
> +\field{VIRTIO_RTC_FLAG_CROSS_CAP} in the \field{flags} field if the
> +clock supports cross-timestamping for the particular clock and hardware
> +counter, and clears the flag otherwise.
> +
Hw_counter is also the resource attribute.

> +\end{description}
> +
> +\subsubsection{Read Requests}\label{sec:Device Types / RTC Device /
> +Device Operation / Read Requests}
> +
> +Through \emph{read requests}, the driver requests clock readings from
> +the device. The driver enqueues read requests in the requestq. The
> +device obtains device-side clock readings and forwards these clock
> +readings to the driver. The driver may enhance and interpret the clock
> +readings through methods which are beyond the scope of this
> +specification.
> +
Reading the resource using generic query resource command of [2] will retur=
n the time value.
So only time definition is needed in the resource.
[2] https://lists.oasis-open.org/archives/virtio-comment/202401/msg00096.ht=
ml

> +Once DRIVER_OK has been set, the device should support reading every
> +clock, even when a clock may yet have to be aligned to reference time
> +sources.
> +
> +In general,
> +
> +\begin{itemize}
> +\item clocks may jump backwards or forward, and \item the clock
> +frequency may change. Clocks may be \emph{slewed},
> +	i.e.\ clocks may run at a frequency other than their current
> +	best frequency estimate.
> +\end{itemize}
> +
> +E.g., a clock of type VIRTIO_RTC_CLOCK_UTC can insert UTC leap seconds.
> +
> +As long as a clock does not jump backwards, the driver clock readings
> +increase monotonically:
> +
> +\begin{itemize}
> +\item As long as a clock does not jump backwards in-between device-side
> +	clock readings, the driver-side readings for that clock increase
> +	monotonically as well, in the order in which the driver
> +	marks read requests as available.
> +
> +\item The device marks read requests for the same clock as used in
> +	the order in which the messages were marked as available.
> +\end{itemize}
> +
> +For a clock of type VIRTIO_RTC_CLOCK_MONO, the device always returns
> +monotonically increasing clock readings.
> +
> +The unit of all \field{clock_reading} fields is 1 nanosecond for all
> +clock types which are part of the device specification so
> +far.\footnote{For time epochs in year 1970 or later, this means that
> +time until at least year 2553 can be represented in the \field{le64
> +clock_reading} fields.}
> +
> +\begin{description}
> +
> +\item[VIRTIO_RTC_REQ_READ] reads the clock identified by the
> +\field{clock_id} field. The device supports this message for every
> +clock.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_READ 0x0001 /* message type */
> +
> +struct virtio_rtc_req_read {
> +	struct virtio_rtc_req_head head;
> +	le16 clock_id;
> +	u8 reserved[6];
> +};
> +
> +struct virtio_rtc_resp_read {
> +	struct virtio_rtc_resp_head head;
> +	le64 clock_reading;
> +};
> +\end{lstlisting}
> +
> +\field{clock_reading} is a device-side clock reading obtained after the
> +message was marked as available.
> +
> +\item[VIRTIO_RTC_REQ_READ_CROSS] returns a cross-timestamp for the
> +clock identified by the \field{clock_id}
> +field.\footnote{Cross-timestamping
> +is similar to the ptp_kvm mechanism in the Linux kernel.} This message
> +may yield better performance than using VIRTIO_RTC_REQ_READ.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_READ_CROSS 0x0002 /* message type */
> +
> +struct virtio_rtc_req_read_cross {
> +	struct virtio_rtc_req_head head;
> +	le16 clock_id;
> +	le16 hw_counter;
> +	u8 reserved[4];
> +};
> +
> +struct virtio_rtc_resp_read_cross {
> +	struct virtio_rtc_resp_head head;
> +	le64 clock_reading;
> +	le64 counter_cycles;
> +};
> +\end{lstlisting}
> +
> +The \field{hw_counter} field specifies the hardware counter for which
> +the driver requests a cross-timestamp.
> +
> +Cross-timestamping returns a \field{clock_reading}, and an associated
> +hardware counter value, \field{counter_cycles}. The
> +\field{counter_cycles} field is the approximate or precise value which
> +the driver would have read at the \field{clock_reading} time instant
> +from the hardware counter identified by \field{hw_counter}. How the
> +device determines the value which the driver would have seen is beyond
> +the scope of this specification.
> +
> +The following hardware counter identifiers are specified:
> +
> +\begin{lstlisting}
> +/* Arm Generic Timer CNTVCT_EL0, Counter-timer Virtual Count register
> +*/ #define VIRTIO_RTC_COUNTER_ARM_VIRT 0
> +/* Arm Generic Timer CNTPCT_EL0, Counter-timer Physical Count register
> +*/ #define VIRTIO_RTC_COUNTER_ARM_PHYS 1
> +/* x86 Time-Stamp Counter */
> +#define VIRTIO_RTC_COUNTER_X86_TSC 2
> +\end{lstlisting}
> +
> +Additional hardware counter identifiers may be standardized in the
> +future. Implementation-specific hardware counter identifiers are not
> +recommended and are greater than or equal to 0xF000.
> +
> +The driver can determine whether the device supports
> +VIRTIO_RTC_REQ_READ_CROSS for a specific clock and \field{hw_counter}
> +through VIRTIO_RTC_REQ_CROSS_CAP.
> +
> +\end{description}
> --
> 2.40.1


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

