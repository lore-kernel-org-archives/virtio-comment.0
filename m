Return-Path: <virtio-comment-return-6667-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F25EB64DA
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 22:55:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 702CC2CAD3
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 22:55:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A368986533
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 22:55:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4179798643D; Sun,  2 Jul 2023 22:55:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 23C2998644B
	for <virtio-comment@lists.oasis-open.org>; Sun,  2 Jul 2023 22:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxHuGH8qiq4J11VngAWWpkMLjrbqd8aVPEWTQXX9uh1uwhdgbafHUnc/vw+HsT1o/eDSwKOpfMWZAKl4rr75/yT3iSgQ89ie9vv5HkJvCbTrQRDT3Ljo4+zax7A5LO9JTBVHlUl4c5jG3FjdVM5CZmfD8Bw07AbHQMwcneFX9ZY9DvMD73+MsYRmwwGBPzPHi3/qqvsPXGUjsl9a7X0FIf7/IPaaa63ffaVon88MsB1hBUsUgRFEXywzULud9m6WpeTDVcc+pd7f9I/8aJQWqe25LTIZCynYzr4S3PvoZi6rhuryFD4UTZIujvyZPWTGQW3IpiPBEDLJBE+/EgBbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nmp1YpeHqEcs7tLlu2mSlWBdINhd1vB5itCGj7Pk3xk=;
 b=O95Y9nqsm0WZxgEHv4V2nPEAbrpuw2eHR+h600qJvzBucHODLwtaeUt6S+e9GTPJkYnzkchABTx61p/mywuVX504eTZzZkyFuGU0+pG1LYlAY0cai/Zwexe8aiTzJjDyDBFHuTcuXEkc49rEz6+Vf1/Yz3mMzlxBDjh6tgrWmwZAJSeyYfP8flyLootdMAPzphjVE7XyM3dqtX8AQqekh0vJkfILgEVDm/7jbTkxWoexhPsafsbkVC67Bf1V007fetX9FL7FrsY6jvQAB5EpKYqY2BFqZGn61Okjk4CD2ZD4N5CBh2850X/pIr++7DirUFPQsc0a+pEztXYvKaFxuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Peter Hilber <peter.hilber@opensynergy.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: Cornelia Huck <cohuck@redhat.com>
Thread-Topic: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.
Thread-Index: AQHZqzWn01mUtnPGCUaCuESJ+zAzFa+nCBEQ
Date: Sun, 2 Jul 2023 22:55:35 +0000
Message-ID:
 <PH0PR12MB548182C0D5EB0C6273F30E9CDC28A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230630092959.392381-1-peter.hilber@opensynergy.com>
In-Reply-To: <20230630092959.392381-1-peter.hilber@opensynergy.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW4PR12MB6976:EE_
x-ms-office365-filtering-correlation-id: b4748af7-c745-4282-f20d-08db7b4f72b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PS/0MCjeXHoSQlyr2ahOK+ICTRlAnLqprU1v48JV3/E0ZUeKoDp9BxQCJXRrgw3kJdQ9kDBFHu1XzfK3f9qo+U6s7NXWECXMRo4iJ5lQ9vy72fK6ubyLFtU5R6kO606gKOJsDkgu0GMgg+7Js+hQleLzve43CCY+39PDP29S9L3GIciFfiboa0hu1SLSicfNkbRZjMcFCtq/I73kqfB+bRvONQUQ3GNfe6WInGAt249KJlWNtjztfULNdPT748r0jd8RruXI1vQIBH/aqn90sAP6kfZoDtE9hVWq7fDmnNsYn2ZJaLEWKR3f0DCx3XyjC9qOJmDVPglvo9KeflqJoEgE699sMgaYeSouST96rQi4GhhWOCyUDZeWS12YDC2f/TbpwfWWQFM6UQgY7CMKP8OalwklGhTlB8yg+KjDwtx7WSvJMLuHHkotN4yhnRBy4dnE0MZhR0tZsaZaTaRmUvJrOe+Y97YMEOj7xgP935HmQpMOobppe+smP7I/xwWDu8TEfXrb0j0WMR+KZPb8nprhuLeYl5uvIfQqNMxJ4IqiDlrrBcd+JCCnkfCDJpeXvertuXSmC4xadjXDojvYjaMz1HIjFua28JbQFCvv2iURnyEuTHdisI5+Q5r4+zCaLHp030Kxw9hji3n3PLuz2qM8NMCuciM0SpcyE2d77EI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199021)(316002)(41300700001)(7696005)(966005)(83380400001)(53546011)(186003)(6506007)(26005)(9686003)(478600001)(110136005)(71200400001)(122000001)(66899021)(38100700002)(55016003)(66446008)(66476007)(66556008)(66946007)(64756008)(76116006)(4326008)(52536014)(5660300002)(86362001)(38070700005)(30864003)(33656002)(8936002)(8676002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VTLbj7GziD7QlZ8h1IIY5wXBLyY8fxHrVOBK0sdQRT7XOZMUleUg9aOLgr6/?=
 =?us-ascii?Q?AA4182rn/w6iaeeSS4DJZYE7c4o4jUwXabrMkSvjHUDi3os/V3wMq+TyqPrb?=
 =?us-ascii?Q?vIdP/bReiD5AYKGH5aIUvs0KDQUoyxkTMt5IQrjwm3YUJRr89nMH71gH21j9?=
 =?us-ascii?Q?EWSuHL1DBNzy/vrvFHp2a0ma/8F8m0yeM6kSVVqNbeDA6LelqGxredCOmLVa?=
 =?us-ascii?Q?3L2Qfa4sEkHNRvwZJodoPfKNeChVXkAuDOc+mGpD821wyeccnR3oVzwoUrIC?=
 =?us-ascii?Q?CGO8mavZINrSgEy58vmtQlPeNu9YqDSART6dgqTPNplxR6VUzv+f/h2XspF8?=
 =?us-ascii?Q?uySv89xVw8p1S3oQx0DwwkpEi3VLl3YZOePNICew+y9Vf/MrrbsVi0XeZ4CL?=
 =?us-ascii?Q?kxaFJ0A6slDXGARNZBsPGEb4pbjGfNMWk4Uwm17RySdZoVisAXc6powB398z?=
 =?us-ascii?Q?Dj9jzkuFHHc+K85K/3I/rz1nlXmBKycNCtNobTsDEHgEiCoAIkvkBljW66+8?=
 =?us-ascii?Q?pV/XvXT5sfmrVv+LywH6BIe3S1XFDNGLOBp//S4JSm6ZEp9vnKVsGF0RbC6L?=
 =?us-ascii?Q?mpfwx5gHAOVhdvO/UUyDVvo9T1hkahrZNExgzdHVMTwz4yz9sICd1afOiq3o?=
 =?us-ascii?Q?XmKXpe2cH+rC6eLI8LHIYT57NFm1Bd0GpgX0FFkAVi/KHpXKHAp78UuXPGyc?=
 =?us-ascii?Q?fiWL1VjvH+rJC0z8qFQGcMz72puHh7h5ff7gUXZlrEWmIKoZqzIRTlEh4XYX?=
 =?us-ascii?Q?uGN91TOq/KGGr9kNFSF6vZhi5TsUS3RnGGwaXZfM6dDw9BEOlIjjlJwTGE7d?=
 =?us-ascii?Q?MUWRhc1ljZ3bivARJ6tzJpOJ6sAL/9soZiy4/Qe4BAYWoScV3xtqnrtbRsrQ?=
 =?us-ascii?Q?EkuunKHh1pEEtwxhXb0B8eJDxyaMrgoJJNjYCACqrY/A+/tnvKqxt8EKdDXC?=
 =?us-ascii?Q?IBYOj9D48egAhpTmkwPv3B8MpTByffwGABq3J88yadi6QbHgBW/vq5DgibOl?=
 =?us-ascii?Q?M2cQ+ZjU2snUCk9N5agAXwXU/FDdLXyGEEPNxvC9oAzdbVRSOajBNWtkRbXx?=
 =?us-ascii?Q?Q7jbRpxofd5EVp164RqSseesVfK8ivorV/yXnV6H9NfU5rB3vWgKN1jlXd38?=
 =?us-ascii?Q?heQb6UCqZI2kWRyKD5/oAXpTwB2K2Ig0eWKYuX1H5q+D8bU5RJxy6WlXUECn?=
 =?us-ascii?Q?3i5BsUUzAT177DV8a4MfMSB4NiwJe+lnl0jKinXxOJ5eCs8Fp+7ZfWAvxT5l?=
 =?us-ascii?Q?bn5SY5mYakrBZVy3o7i1aJnWsq4dA3TXxNTJRU16U+odrnRDbRRWrnLXLOUZ?=
 =?us-ascii?Q?A89Jh73bs5VwmrtGzG2Tl6tG28f26tLbuxPk0833sf+tsm8b4YaEhxLTTAZf?=
 =?us-ascii?Q?bO1ICUq80evvxcAiOhsbdbyEGGtQLD3vJwRvX7SzVmLTdE9oltzpYB2nDzSs?=
 =?us-ascii?Q?mOAVOd0/G2nZrq26KfFqegYzG6NIEi2olF4Sl36NualjkPoW6uOty+1VUma4?=
 =?us-ascii?Q?fyLkd4PTDWWcTz0hfbeCkmqxHANpOH1xY+dB8NW3vKlyBulnkZmegWl3nJph?=
 =?us-ascii?Q?70HPTiP6XvDYbPzFeZY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4748af7-c745-4282-f20d-08db7b4f72b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2023 22:55:35.9557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Jasn0lPGGu4iO8j5JEqc2GGN7YsvyhlWxJ8OMREk5AppMhdKnUTfd8SttXTECY+E99ktC8qmliiFBotHk2XkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6976
Subject: RE: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.



> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Peter Hilber
> Sent: Friday, June 30, 2023 5:30 AM
> Subject: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device specifica=
tion.
>
Tiny nit: remove full stop from the subject, it usually does not have it.
=20
> This is a partial draft for a Real-Time Clock (RTC) device. The virtio-rt=
c device
> provides information about current time through one or more clocks.
>=20
> v2 is a minor update which should match the Linux kernel driver patch ser=
ies to
> be posted soon. It is planned to add a timer/alarm feature as part of a l=
ater draft
> spec update.
>=20
> The draft uses the "Timer/Clock" device id which is already part of the
> specification. This device id was registered a long time ago and should b=
e
> unused according to the author's information. The name "RTC" was determin=
ed
> to be the best for a device which focuses on current time, but is up to
> discussion.
>=20
> For this device, there is a prototypical Linux kernel driver for which up=
streaming
> is planned, and a proprietary device implementation.
>=20
> In the spec text, there is some redundancy between the informative and th=
e
> normative text. The intent is that the informative text already gives all=
 the
> essential information about the device.
>=20
> In the spec, clock ids are 64 bit wide to have unique ids when supporting=
 clock
It is unclear the namespace of uniqueness.
Do you mean unique id across multiple virtio devices?
If so, how is it proposed, we probably need UUID?

> hot-plugging in the future.
>=20
> Any feedback is appreciated very much.
>=20
This is a good feature.

A network device has a PHC which is very similar to what is being proposed =
here which is super set of this proposal.

A network device will support packet timestamping as phase-1, followed by P=
TP synchronized UTC/TAI format in phase-2 followed by PTP timestamping offl=
oad in phase-3.
Phase-1 is already being proposed using monotonic clock method at [1].

[1] https://lists.oasis-open.org/archives/virtio-comment/202306/msg00287.ht=
ml

We would like to have a single virtio network device to expose the optional=
 RTC without creating a full blown new virtio device.

A quick grep in the industry indicates that at least 15+ nics in industry w=
ith dual PTP clock + nic functionality.
And we would like virtio network device also to have it.
At minimum such solution avoids creating an additional full blown virtio de=
vice.

As proposed here, RTC device as stand alone itself has its merit and use.

So lets build the RTC device interface that can be of dual use.
1. as part of stand alone RTC device
2. as part of virtio network device

Such work will enable to re-invent the wheel 2nd time in virtio net.

What I can think of is following definitions being common between two devic=
e types.
This will be able to leverage your rtc work done as part of this patchset.

1. _F feature bit that can be common between the rtc and net device
2. control vq command opcode and format be common
3. discovery of the readq id possibly using cvq and it must depend on _F_RE=
SET bit.

> --- /dev/null
> +++ b/device-types/rtc/description.tex
> @@ -0,0 +1,582 @@
> +\section{RTC Device}\label{sec:Device Types / RTC Device}
> +
> +The RTC (Real Time Clock) device provides information about current
> +time. The device can provide different clocks, e.g.\ for the UTC or TAI
> +time standards, or for physical time elapsed since some past epoch.
> +Drivers can read the clocks with simple or more accurate methods.
> +
The driver can read...

I am not sure if I see two different methods to read (simple and accurate o=
ne).
Is if the readq that is accurate one?

> +\subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
> +
> +17
> +
> +\subsection{Virtqueues}\label{sec:Device Types / RTC Device /
> +Virtqueues}
> +
> +\begin{description}
> +\item[0] readq
> +\item[1] controlq
> +\end{description}
> +
> +The driver initiates clock readings through requests to the
> +readq.
The driver initiates (or enqueues) clock reading requests to the readq.
Does above read better?

\footnote{The readq is a dedicated virtqueue to facilitate
> +reducing latency for clock readings, which may be more
> +performance-sensitive than other requests.} The driver uses the
> +controlq for other requests to the device.
> +
> +\subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature
> +bits}
> +
> +\begin{description}
> +\item[VIRTIO_RTC_F_READ_CROSS (0)] Device supports cross-timestamping.
> +\end{description}
> +
> +VIRTIO_RTC_F_READ_CROSS determines whether the device supports clock
> +reading with cross-timestamping. Without this feature, the device does
> +not support cross-timestamping. Even when this feature was negotiated,
> +the device may still not support cross-timestamping for some clocks, or
> +for particular requests.
> +
Can you please explain why even after feature negotiation, device may still=
 not support?
Is it because the cross timestamping is per clock feature?
If so, I guess no need of a feature bit as it is not serving any meaningful=
 purpose.
Each clock information can advertise what is supports, right?

> +\devicenormative{\subsubsection}{Feature bits}{Device Types / RTC
> +Device / Feature bits}
> +
> +The device SHOULD offer VIRTIO_RTC_F_READ_CROSS if the device can
> +support cross-timestamping for any of its clocks.
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
> +\subsection{Device Operation}\label{sec:Device Types / RTC Device /
> +Device Operation}
> +
> +For the readq and the controlq, the driver sends a message with a
> +request, and receives the response in the device-writable part of the
> +message. readq and controlq messages use common request and response
> +headers.
> +
Below structure definition is _req and response.
So lets just call it request and request_type as its simple to explain usin=
g single thing.
Please drop the wording around message.

> +\begin{lstlisting}
> +/* common request header */
> +struct virtio_rtc_req_head {
> +	__le16 msg_type;
> +	__u8 reserved[2];
> +};
> +
> +/* common response header */
> +struct virtio_rtc_resp_head {
> +	__u8 status;
> +	__u8 reserved[3];
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
> +#define VIRTIO_RTC_S_UNSUPP 1
> +#define VIRTIO_RTC_S_NODEV 2
> +#define VIRTIO_RTC_S_INVAL 3
> +#define VIRTIO_RTC_S_DEVERR 4
> +\end{lstlisting}
> +
Recently for the AQ we picked Linux UAPI specific error codes such as EAGAI=
N, EINVAL etc.
You might want to have similar code reused for EINVAL, NOTSUPPORT, NODEV to=
 be reused here.
No strong opinion though.

[..]
When the device and driver normative lines are long like this, it is best t=
o put in separate patch, so that its easy to read (review) through the whol=
e description and conformance as separate.

> +\item[VIRTIO_RTC_M_CFG] discovers the number of clocks.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_M_CFG 0x1000 /* message type */
> +
Like above, lets just call it RTC_REQ_CFG as below is a request structure.

> +struct virtio_rtc_req_cfg {
> +	struct virtio_rtc_req_head head;
> +	/* no request params */
> +	__u8 reserved[4];
> +};
> +
> +struct virtio_rtc_resp_cfg {
> +	struct virtio_rtc_resp_head head;
> +	__le16 num_clocks;
> +	__u8 reserved[10];
> +};
> +\end{lstlisting}
> +
> +Field \field{num_clocks} contains the number of clocks. A device
> +provides zero or more clocks. Valid clock ids are those smaller than
> +\field{num_clocks}.
> +
> +\item[VIRTIO_RTC_M_CLOCK_CAP] discovers the capabilities of the clock
> +identified by the \field{clock_id} field.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_M_CLOCK_CAP 0x1001 /* message type */
> +
> +struct virtio_rtc_req_clock_cap {
> +	struct virtio_rtc_req_head head;
> +	__u8 reserved[4];
> +	__le64 clock_id;
> +};
Please drop "__" from the field data type definition.

> +
> +struct virtio_rtc_resp_clock_cap {
> +	struct virtio_rtc_resp_head head;
> +	__le16 type;
> +	__u8 reserved[10];
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
> +subdivisions) since some unspecified epoch. The VIRTIO_RTC_CLOCK_MONO
> +epoch is before or during device reset.
> +
> +Additional clock types may be standardized in the future.
> +Implementation-specific clock type definitions are not recommended and
> +use a clock type id greater than or equal to 0xF000.
> +
> +\item[VIRTIO_RTC_M_CROSS_CAP] discovers whether the device supports
> +cross-timestamping for a particular pair of clock and hardware counter.
> +If the VIRTIO_RTC_F_READ_CROSS feature has been negotiated, the driver
> +can send the VIRTIO_RTC_M_CROSS_CAP message.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_M_CROSS_CAP 0x1002 /* message type */
> +
> +struct virtio_rtc_req_cross_cap {
> +	struct virtio_rtc_req_head head;
> +	__le16 hw_counter;
> +	__u8 reserved[2];
> +	__le64 clock_id;
> +};
> +
> +#define VIRTIO_RTC_FLAG_CROSS_CAP 0
> +
> +struct virtio_rtc_resp_cross_cap {
> +	struct virtio_rtc_resp_head head;
> +	__u8 flags;
> +	__u8 reserved[11];
> +};
> +\end{lstlisting}
> +
> +The \field{clock_id} field identifies the clock, and the
> +\field{hw_counter} field identifies the hardware counter, for which
> +cross-timestamp support is probed. The device sets bit
> +\field{VIRTIO_RTC_FLAG_CROSS_CAP} in the \field{flags} field if the
> +clock supports cross-timestamping for the particular clock and hardware
> +counter, and clears the bit otherwise.
> +
> +\end{description}
> +
> +\devicenormative{\paragraph}{controlq Operation}{Device Types / RTC
> +Device / Device Operation / controlq Operation}
> +
> +For a fixed controlq message request value V, the device SHOULD either,
> +for every request with value V, always execute successfully, or, for
> +every request with value V, always set a fixed \field{status} other
> +than VIRTIO_RTC_S_OK.
> +
> +For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the UTC
> +time standard (Coordinated Universal Time).
> +
> +For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the
> +time epoch of January 1, 1970, 00:00 UTC.
> +
> +For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the TAI
> +time standard (International Atomic Time).
> +
> +For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the
> +time epoch of January 1, 1970, 00:00 TAI.
> +
> +For any clock of type VIRTIO_RTC_CLOCK_MONO, the device MUST use SI
> +seconds subdivisions.
> +
> +For any clock of type VIRTIO_RTC_CLOCK_MONO, the device MUST use an
> +epoch at a time instant before or during device reset.
> +
> +For message VIRTIO_RTC_M_CLOCK_CAP, the device MUST set \field{type} to
> +one of the clock types defined in this specification, or to a value
> +greater than or equal to 0xF000.
> +
> +For a VIRTIO_RTC_M_CROSS_CAP message M, the device MUST set the
> +VIRTIO_RTC_FLAG_CROSS_CAP bit in the \field{flags} field if the device
> +would respond to a VIRTIO_RTC_M_READ_CROSS message with the same
> +\field{hw_counter} and \field{clock_id} values as in M with status
> +VIRTIO_RTC_S_OK, and clear the bit otherwise.
> +
> +\drivernormative{\paragraph}{controlq Operation}{Device Types / RTC
> +Device / Device Operation / controlq Operation}
> +
> +The driver MUST put the request into the device-readable part of the
> +controlq message.
> +
> +The driver MUST allocate enough space for the response in the
> +device-writable part of the controlq message.
> +
> +The driver MUST negotiate VIRTIO_RTC_F_READ_CROSS before sending a
> +VIRTIO_RTC_M_CROSS_CAP message.
> +
> +For VIRTIO_RTC_M_CROSS_CAP, the driver MUST set \field{hw_counter} to
> +one of the hardware counter identifiers defined in this specification,
> +or to a value greater than or equal to 0xF000.
> +
> +\subsubsection{readq Operation}\label{sec:Device Types / RTC Device /
> +Device Operation / readq Operation}
> +
> +The driver requests clock readings through readq messages. The device
> +obtains device-side clock readings and forwards these clock readings to
> +the driver. The driver may enhance and interpret the clock readings
> +through methods which are beyond the scope of this specification.
> +
> +Once DRIVER_OK has been set, the device should continuously support

The word "continuously" is likely not needed.
As long as readq is created, driver can read it.

> +reading every clock, even when a clock may yet have to be aligned to
> +reference time sources.
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
> +	marks readq messages as available.
> +
> +\item The device marks readq messages for the same clock as used in
> +	the order in which the messages were marked as available.
> +\end{itemize}
> +
> +For a clock of type VIRTIO_RTC_CLOCK_MONO, the device always returns
> +monotonically increasing clock readings.
> +
> +The unit of all \field{clock_reading} fields is 1 nanosecond for all
> +clock types which are part of the device specification so
> +far.\footnote{For time epochs in year 1970 or later, this means that
> +time until at least year 2553 can be represented in the \field{__le64
> +clock_reading} fields.}
> +
> +\begin{description}
> +
> +\item[VIRTIO_RTC_M_READ] reads the clock identified by the
> +\field{clock_id} field. The device supports this message for every
> +clock.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_M_READ 0x0001 /* message type */
> +
> +struct virtio_rtc_req_read {
> +	struct virtio_rtc_req_head head;
> +	__u8 reserved[4];

I think the req_head structure to be 64-bit aligned, so that here individua=
l requests does not have to align it.

> +	__le64 clock_id;
> +};
> +
> +struct virtio_rtc_resp_read {
> +	struct virtio_rtc_resp_head head;
> +	__u8 reserved[4];
> +	__le64 clock_reading;
> +};
> +\end{lstlisting}
> +
> +\field{clock_reading} is a device-side clock reading obtained after the
> +message was marked as available.
> +
If this clock device is a PCI device, on an empty system, a PCI device has =
to do at least couple of DMA.
1. read the descriptor (250 to 300nsec)
2. Read the request (250 to 300nsec)
3. Write the response (50 nsec+)
4. raise interrupt.

How is this time delta accounted in clock reading?
Is driver expected to record system time and subtract it on receiving respo=
nse?
Or?

Ran out of time.
Will continue after I get above base line alignment.

Thanks.

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

