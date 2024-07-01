Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2116.outbound.protection.outlook.com [40.107.215.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DA3823DE
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jul 2024 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719822292; cv=fail; b=B8/yWXC8ShnSjUJ8x85F2X2EUXDyZFzsLddXBr8F2r5FcbEM919j5aNOXoX82nDkN1EQ0EcLisdl9qBR/icPPmPq0+W7nrnr/wt1VY0fEe7WnshqgJRsJKOgghl5yINTfhvWiBxSithdba6IO7Fp3vXCeZq8OaXCuLNKltQhkWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719822292; c=relaxed/simple;
	bh=jefBwY9IfqAnnuCZTndH4DizJkBObJT82WHt7E5mDwQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kWa6JH0HMif3rfQ9GX8iMdb/XHFGlF7VzhVSd85HOWa2+EpQoXYcFEJu5TmxxEAEoJunItkE3/u5g2n6No/7/ni6Pi1QJ5fWGXodD/1rnBSUdrIONq2gr+GZBq6YPioTe+JrpXkMXq7+U812cPjU2kGYZDDkHUftMU0JSgUWF4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=nCOr/rrd; arc=fail smtp.client-ip=40.107.215.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="nCOr/rrd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFZAZHBMvwGqg0rQpXCZJ938TocWvUORkDtWAcffzA/JEL71VMZ6OjDKDVajwWLh/NfZk/zZ2MEh18dSB8zmkljmVzDDiS1sDFVxSY3EjoHmBjEdgDOLNtzG96IEw234ndYIVC+55XegxoB5WJ4D+OEUWq3wqS0Vtu5HPbI7zf4zqtplKm0U/lvgNgxGBbcngz8uFj4RxXcdIwLnWa7MywODKogpkkaV+yDgAWI3IbKZyGzpbwGVfcKzWAwzP8M/juOUPKzCpk1SQkR1LZdcYtNERqbWOo3p5e74INHPsiDD0ZU+LcPSgsbqR6rGzV5DHk0hWAm0ajlp43wSKV95ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m9yaAV1wqPrgz7Rq3UAavGiEUexZNnYIGscPGZRD0Q=;
 b=EbkNxkzL7UlFFormCv524xNgqnxzGW6X6sn6cbP7vNL0TtPDFN3Ku3SaQbSgUU+q/90cx12mr7n9ceJplH1eOuiep78Jc1xBexmuZe0L6Jsk1EyRqXKdPYiwBPMg/Mrw1nu8I8iYuTMSutj6JpAkhrptEXClkulNpBbwxMuOEO4L9or9VcYdxUUUUIapaj1/Jigp1Vj7BsP4+/Zi4sIugFfAn/uxRa2EoILMdPd1oMMKa1UPEZxiTKaWJY/W1pkkcXuCgxvUyqUyy0L4Ok+Z4jIaBEOrssYipJA71Gpu5IyYiIEI7nJaYdhUa2h3sk4FlQ+MsZTwypUUYVcgGdsTXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2m9yaAV1wqPrgz7Rq3UAavGiEUexZNnYIGscPGZRD0Q=;
 b=nCOr/rrdYRVrlpxFs3yQcQAMaJjJUa5uP3e7DIavYBj3FP+HmzmBNfAG5gi59U/TTyz+c/FqKpvLqdEAGC3UhQYbOvI4vVrt5tQ+eI5IzH8Rv9Who1UnVM2ssahDpi0MzuX2fXfueHec+sZcQkxnQVzfbtodIVR7v4WbUMxeRjHXJFezWumB3MUJVqWgmD9m9uCbfcvAx4YzdykTfwyICQVa+mP5o0YPXdwV5mmozV1BB9UjROce4DpsEG1sPcmy6nwug/1US2xpI7zib2btwdEDrCN6HGWur3bbKpB+Id907K2TZUt/RaAxknIQW/pMkCAlTzWCay9vfd4HcSW5Eg==
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com (2603:1096:4:1ec::12)
 by SEYPR06MB5860.apcprd06.prod.outlook.com (2603:1096:101:bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Mon, 1 Jul
 2024 08:24:39 +0000
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd]) by SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd%6]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 08:24:37 +0000
From: Lege Wang <lege.wang@jaguarmicro.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "parav@nvidia.com" <parav@nvidia.com>,
	"mst@redhat.com" <mst@redhat.com>
Subject: RE: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Topic: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Index: AQHay2kF67vqaBJYMUW1XCStKdNnOLHhiDdQ
Date: Mon, 1 Jul 2024 08:24:37 +0000
Message-ID:
 <SI2PR06MB538526AECEABABFE4E6208D8FFD32@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
In-Reply-To: <20240701034435.675-1-lege.wang@jaguarmicro.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|SEYPR06MB5860:EE_
x-ms-office365-filtering-correlation-id: 668463a0-5aa3-4cdd-3b44-08dc99a73ef9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?dXq9Anj4y5Pc/77d7zXVptQvdEPr5OzRsFH4HwcprM7gDZzRZOGS2bzz?=
 =?Windows-1252?Q?ROYMSPuuc+qUg4qpEFO2NbUqV7jR9n/708UcLOYJF0m0q4Sj6KFSFMut?=
 =?Windows-1252?Q?yN5dN3jqLQYv5Cepi0TksU2+oseoZqm027PwCg6jwgTq66Fe0T+Di3cl?=
 =?Windows-1252?Q?nS9dChKdk6tokZ5/IJfnxQzu5eedwBbJrcHamJbNoEoreOmAvDeZkkuN?=
 =?Windows-1252?Q?8198q0/NUGPeYyZnhJj23dJQUZWdy5JetnJS2U/3thQyjmgXzqRxp171?=
 =?Windows-1252?Q?rurmf8kFBwmQcw/KXxzsTiaXR07CgKXSSlqSw50lAOq84lT7Gd50Exc9?=
 =?Windows-1252?Q?1bGelErB4kxmEd9F/NMRBCvtf/L1ksC0hci9pPvSMdDXPG+bw5MniwSn?=
 =?Windows-1252?Q?HzXDij8t5vTNnQYt4pAgukHiV6za7aT3Hbs2e8KwdW+6oIPTExMTn4sD?=
 =?Windows-1252?Q?wbXIRmMJeeZBHPrtjeFbEObPqARxgT1ysufVd34OgNrlB5Q0+jU527lc?=
 =?Windows-1252?Q?64K+lbNh6ttMzrofIVyylPfD7OssROiVTf8Nb0heMBIOPG5PmfVFI91y?=
 =?Windows-1252?Q?b1cUV4ShmVn8tlt/n9NI5KEJIIm6I+MdTb5xHevpwhIOFnxlCzP1lPdh?=
 =?Windows-1252?Q?Xaox7xQb/QACCX27RQNinrIGwEYpxKxEGmGoe0dkEEyv0iRCZ9hLyf6M?=
 =?Windows-1252?Q?TeBp/i6MZ2UJHBFlr+SMLHo4IzD2A4BGQicfjDKV8yxyeDsFsFSsZ3d8?=
 =?Windows-1252?Q?2q20pOU4+IpT5Hosp7J9KlqjFeibFLnPHk3Y4USQlzXa8TR1BEOnzeMP?=
 =?Windows-1252?Q?86Yvwo0GAoETd04onTf708hmhkVbiUrgkq3nZMoB66g4lS1yxjPLpm0L?=
 =?Windows-1252?Q?O5cE/C7BXt5wFfe+XTRFLvkuw4N5f56ASCgtrLTgQysk1/OlVNltU8bh?=
 =?Windows-1252?Q?8B2KZ/ihO48So5+IpSjmhXI2q6MkF7MqRVrfJZo6HpJ21OH882CrkiSh?=
 =?Windows-1252?Q?9njWkOE0dwoKOnfhmdmcadbFLLO/zHb7cvFFFKn4cXStfe6ROIWuKzeF?=
 =?Windows-1252?Q?JmDGzaqKfJsKY/S36vaxq82482W30ny9G70AD6neqYFwGpn3dAY895fn?=
 =?Windows-1252?Q?Q24sXoP3SIYWZAYctQn8YD9txgSAAWdkbRtaDZ45a2TOtePrEBCnJceC?=
 =?Windows-1252?Q?AQtL8X+jj2db6YlROdhZW8E5sgLKKpOFNg4UjHtlxmcKgv0caGidpDwr?=
 =?Windows-1252?Q?cNr5wjOEOCJyjsTiHfA0sJM6b/YNycv+MVfQYP1lwHhBSKWf45T5UPbg?=
 =?Windows-1252?Q?DOtAOfbD3Y94TwdxndgyWgiqCCcSEoSZQRMVHOLKNDK5kQvFQff045VF?=
 =?Windows-1252?Q?4SxxxwOdRs7o5oDu8kDcI6P9jZa+jY6z3H9XucyhZTaHhOhQKKU5iqiC?=
 =?Windows-1252?Q?xfYpUL5fKlyyhzFNuJAjTgz1pfai35UqSnQmjee6ru6nj2e+PvdjkRWg?=
 =?Windows-1252?Q?fPWdJskQ0CTJUaCMnuv6WsvqTzLf1w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?LuAXch50p/c022OzvEVqFP77NXkcdQ6IsrA4ojHDlZbm9tNS9HxJZ6Aa?=
 =?Windows-1252?Q?3P72Cu05gPDu0epa+OHaM96JjvVmqdPPJkrZiYSjjE5DrGKOrpCuwEMW?=
 =?Windows-1252?Q?iNR5mCHnZXv0ZBiFmw1ITgA9+oS7/Z5SL9tMxAh44/ZH/kwU7w/lgDMn?=
 =?Windows-1252?Q?CxgFtWSiVnRzq6IrgpqNaZujZyi+a5qRkDLyxzcW26JWNSFY7kc4hfr6?=
 =?Windows-1252?Q?JF6uiRsJbFGlIDFysQle0iwE3vy9OJAJz0emqS3f3wRgodClsDpvDiA1?=
 =?Windows-1252?Q?8vXNK82TSa49YgaWUhS3ciKvnmv08TF6cSbvC9cLS3StBRUf8qEvOapf?=
 =?Windows-1252?Q?ugceirQ1BVs7BBE8DQ8a7B8oedChQbGuSQFg+Ka9bdFHwlUqODxacGM9?=
 =?Windows-1252?Q?CZdLoUWKKI4YOLtV2bfYZLiC/wfsWTBvLiCbLNxMzUqF+dU73B40psXH?=
 =?Windows-1252?Q?8LbliZtSdirB9wHvLq8MpACo/vPrqNI1f3/cNnuVl3F3O74QUkZSkrB9?=
 =?Windows-1252?Q?iGIYg7SZUhLXQ1Z117R4VP8T7NrqFvtZgWX36cCaBytan4IX5OR1ZHiK?=
 =?Windows-1252?Q?GdTmwBXZOWKuh6+e98wRssmRBqPSwHtx/ex39QkbCAh939mMdcsv9bxk?=
 =?Windows-1252?Q?L46NYUVaete0g4Sa/xMmh65OUYBCl4Vwe3FoaWVlDGU8YKUROoShyqlQ?=
 =?Windows-1252?Q?jVoHlPayozNz/6AqZ2j8u8TUAwpf3eQi04UpVAmeZCsNkJvMwmUOGZ1k?=
 =?Windows-1252?Q?+ZlkSjW5cUnV68FSeWFDuTEdxkI6QK2z2xFIlgQj9gjXXUUWYYGHKZ5g?=
 =?Windows-1252?Q?94OQzDckFAnl7mo6C3BAeF0cHHbjCb4JHoDnFvw6hQ+sTjuXUiorb/J7?=
 =?Windows-1252?Q?0eeI18ce8yTATOPNEMeVF7ZGiCFRTfK/FUn98szv0xJpQMoaJWV4ZoC5?=
 =?Windows-1252?Q?lLACuP19TJDIy/vQBQ/U8l09dLGt+9CEljWItqvrlPAvFjmwZZonUk2Y?=
 =?Windows-1252?Q?PdHpzZe68cGuggJd6Vcho2pZuD9WqxlOeVNB24OG1L8qaVp6BRUvRBvT?=
 =?Windows-1252?Q?C3DSUzMM00ndZkByX8LUBlRchqK2eFbyzBZ74IerNqeTqYxEHmQctIJ5?=
 =?Windows-1252?Q?glPVpXh3gPOQ8xGBAoVAqjslyiKID2SaVc3JNN8ViNjnU9W67wcvv4lJ?=
 =?Windows-1252?Q?BMq02M2i6NG/6ZhrLhdDr5PzB6sXnbeVkhz7M9sVz7GDcgfVfEVnOZ8s?=
 =?Windows-1252?Q?dQDpL0hnsGyTjFJYAtZe4m5vI3k980tIXbB+gVcbtnlnlU2TqUqUASp0?=
 =?Windows-1252?Q?OBYMNGNDzrLoHs+vuuYFJx3zSo3h1G2vLTFNUG55nCmQ5Fmlsbnt2WWH?=
 =?Windows-1252?Q?1pru6NNeRXDZj/Yn97XeHwvlp1vl1Q5orNcMRin6cYIMjWgXqMS43L0H?=
 =?Windows-1252?Q?1/NM9TGz5meWcv2u+jJhT4u7H7phbOEIeyJVnljLU8aa+r6OIolELIFW?=
 =?Windows-1252?Q?6mP7op/e7ZPUclDo07fgKqMHUGxCb3lG03hsDVn9Db3rXR/b3V8EY+hS?=
 =?Windows-1252?Q?aPVisYlNDyoLnrJk2KOnXwSH1/WxTxwxcLpERcPlGrA5Zn8fy9GdGKeK?=
 =?Windows-1252?Q?DNhhVWsL/Pv5RzEZX6APY2rH6l78Q3SmxUfFQT+2sH6hyWzOjawx+kp6?=
 =?Windows-1252?Q?PnOHc5bF1ivkt7/MgbAgHEuThmEm4Z4j?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668463a0-5aa3-4cdd-3b44-08dc99a73ef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 08:24:37.4527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DW4yYf4fx9Tut/uIX5jlZsxfP8nryKs9TzCQYe7grMApGOu9/zvn57d4ZpKhy9d/UyjRTMp/2GpwjVJ2rL3PGono7Er7mbcRgxFG3rw6v10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5860

Hi Vamsi,

I had planed to submit this v1 last week, but was really busy with other wo=
rk, sorry for delay.
And please help to review this patch, which I still think it's not mature e=
nough.

Regards,
Xiaoguang Wang

> -----Original Message-----
> From: Lege Wang <lege.wang@jaguarmicro.com>
> Sent: Monday, July 1, 2024 11:45 AM
> To: virtio-comment@lists.linux.dev
> Cc: vattunuru@marvell.com; ndabilpuram@marvell.com; parav@nvidia.com;
> mst@redhat.com; Leo Liu <leo.liu@jaguarmicro.com>; Angus Chen
> <angus.chen@jaguarmicro.com>; Lege Wang <lege.wang@jaguarmicro.com>
> Subject: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
> notification suppression mechanism
>=20
> Currently for the PCI transport, used buffer notification suppression
> informations are located in guest memory, for example, pvirtq_event_suppr=
ess
> for packed ring and virtq_avail for split ring, then PCI devices simulate=
d
> by hypervisors, such as QEMU, can vist these suppression informations
> directly before issuing used event, the only overheads may be just proper
> memory barriers, but for some hardware PCI devices offered by
> DPU(Data Processing Unit), DPU would need to submit DMAs to copy guest
> suppression informations to DPU internal memory, then check whether
> used event should be notified by examing this internal memory, which
> is obvious expensive, and this DMA operation is needed every time
> DPU attempts to issue used event, DPU may also choose to add a hardware
> component to polling suppression informations by submit DMAs continuously
> to get newest used event suppression infos, but it's also expensive.
>=20
> To help improve this sitiuations, add a new feature:
> VIRTIO_F_USED_EVENT_AUTO_DISABLE. When this feature bit is negotiated,
> devices will place new notification area for used buffer suppression
> notification in PCI bar specfied by virtio_pci_notify_cap, also for bette=
r
> used buffer notification coalescing, the device will disable later used
> buffer notifications automatically after sending one used buffer notifica=
tion
> to driver, and after the driver finishes handling current used buffer eve=
nt,
> it needs to notify the device to enable used buffer notification again by
> writing above new notification area in PCI bar. Device will receive
> this notification reliably, and device knows that it can issue used event
> now, but it may choose appropriate timing to send used events according t=
o
> its notification coalescing policy , now it also does not need to DMA gue=
st
> memory to obtain notification suppression.
>=20
> Signed-off-by: Xiaoguang Wang <lege.wang@jaguarmicro.com>
> ---
>  content.tex       | 38 ++++++++++++++++++++++++++++++++++++++
>  transport-pci.tex | 26 +++++++++++++++++++++++++-
>  2 files changed, 63 insertions(+), 1 deletion(-)
>=20
> diff --git a/content.tex b/content.tex
> index 0a62dce..84505da 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -448,6 +448,7 @@ \section{Driver Notifications} \label{sec:Basic Facil=
ities
> of a Virtio Device /
>  The driver is sometimes required to send an available buffer
>  notification to the device.
>=20
> +\subsection{Available Buffer Notifications} \label{sec:Basic Facilities =
of a
> Virtio Device / Driver notifications / Available Buffer Notifications}
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
>  this notification contains either a virtqueue index if
>  VIRTIO_F_NOTIF_CONFIG_DATA is not negotiated or device supplied
> virtqueue
> @@ -488,6 +489,35 @@ \section{Driver Notifications} \label{sec:Basic
> Facilities of a Virtio Device /
>  has been negotiated, these notifications would then have
>  identical \field{next_off} and \field{next_wrap} values.
>=20
> +\subsection{Used Buffer Event Enable Notifications} \label{sec:Basic Fac=
ilities
> of a Virtio Device / Driver notifications / Used Buffer Event Enable
> Notifications}
> +This kind of notification is only necessary when
> VIRTIO_F_USED_EVENT_AUTO_DISABLE has been negotiated.
> +When this feature bit is negotiated, the device will disable used buffer
> notification
> +automatically after sending one used buffer notification to the driver, =
and
> after the driver
> +finishes handling current used buffer event, it needs to notify the devi=
ce to
> enable used
> +buffer notification again.
> +
> +\begin{description}
> +\item [vq_index or vq_notif_config_data] Either virtqueue index or devic=
e
> +      supplied queue notification config data corresponding to a virtque=
ue.
> +\item [used_off] Offset
> +      within the ring where the latest used ring entry the driver has
> processed.
> +      Without VIRTIO_F_RING_PACKED this refers to the 14 least significa=
nt
> bits of the
> +      offset (in units of descriptor entries) within the descriptor ring=
 where
> the latest used
> +      ring entry the driver has processed. With VIRTIO_F_RING_PACKED thi=
s
> refers to the offset
> +      (in units of descriptor entries) within the descriptor ring where =
the
> latest used ring
> +      entry the driver has processed.
> +\item [used_wrap] Wrap Counter.
> +      With VIRTIO_F_RING_PACKED this is the wrap counter
> +      referring to the latest used descriptor where the driver has proce=
ssed.
> +      Without VIRTIO_F_RING_PACKED this refers to the most significant
> bit(bit 14) of the
> +      offset (in units of descriptor entries) within the descriptor ring=
 where
> the latest used ring
> +      entry the driver has processed..
> +\item [enable_notify] Whether to enable used buffer notification.
> +      The driver may benefit from just informing device the latest used =
ring
> entry
> +      it has processed, but not enabling used buffer notification. This =
field
> only
> +      occupies one bit, if set to 1, it will enable used buffer notifica=
tion,
> otherwise not.
> +\end{description}
> +
>  \input{shared-mem.tex}
>=20
>  \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Devic=
e /
> Exporting Objects}
> @@ -872,6 +902,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits=
} for
>  	handling features reserved for future use.
>=20
> +  \item[VIRTIO_F_USED_EVENT_AUTO_DISABLE(42)] This feature indicates
> that the device
> +  will disable used buffer notification automatically after sending one =
used
> buffer notification.
> +  Note: when VIRTIO_F_RING_PACKED has not been negotiated, the
> maximum queue
> +  size MUST NOT be greater than 16384, when VIRTIO_F_RING_PACKED has
> been negotiated,
> +  the maximum queue size MUST NOT be greater than 16383.
> +
> +  See \ref{sec:Basic Facilities of a Virtio Device / Driver notification=
s / Used
> Buffer Event Enable Notifications}
> +
>  \end{description}
>=20
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..62ba9dc 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -551,6 +551,13 @@ \subsubsection{Notification structure
> layout}\label{sec:Virtio Transport Options
>          cap.offset + queue_notify_off * notify_off_multiplier
>  \end{lstlisting}
>=20
> +If the VIRTIO_F_USED_EVENT_AUTO_DISABLE feature has been negotiated,
> \field{notify_off_multiplier} is also
> +combined with the \field{queue_notify_off} to derive the Queue Notify
> address for enabling
> +used buffer notifications within a BAR for a virtqueue, but add a 4 byte=
s
> offset:
> +\begin{lstlisting}
> +        cap.offset + queue_notify_off * notify_off_multiplier + 4
> +\end{lstlisting}
> +
>  The \field{cap.offset} and \field{notify_off_multiplier} are taken from =
the
>  notification capability structure above, and the \field{queue_notify_off=
} is
>  taken from the common configuration structure.
> @@ -563,7 +570,7 @@ \subsubsection{Notification structure
> layout}\label{sec:Virtio Transport Options
>  \devicenormative{\paragraph}{Notification capability}{Virtio Transport
> Options / Virtio Over PCI Bus / PCI Device Layout / Notification capabili=
ty}
>  The device MUST present at least one notification capability.
>=20
> -For devices not offering VIRTIO_F_NOTIFICATION_DATA:
> +For devices not offering VIRTIO_F_NOTIFICATION_DATA or
> VIRTIO_F_USED_EVENT_AUTO_DISABLE:
>=20
>  The \field{cap.offset} MUST be 2-byte aligned.
>=20
> @@ -596,6 +603,23 @@ \subsubsection{Notification structure
> layout}\label{sec:Virtio Transport Options
>  cap.length >=3D queue_notify_off * notify_off_multiplier + 4
>  \end{lstlisting}
>=20
> +For devices offering VIRTIO_F_USED_EVENT_AUTO_DISABLE:
> +
> +The device MUST either present \field{notify_off_multiplier} as a
> +number that is a power of 2 that is also a multiple 4,
> +or present \field{notify_off_multiplier} as 0.
> +
> +The \field{cap.offset} MUST be 4-byte aligned.
> +
> +The value \field{cap.length} presented by the device MUST be at least 8
> +and MUST be large enough to support queue notification offsets
> +for all supported queues in all possible configurations.
> +
> +For all queues, the value \field{cap.length} presented by the device MUS=
T
> satisfy:
> +\begin{lstlisting}
> +cap.length >=3D queue_notify_off * notify_off_multiplier + 8
> +\end{lstlisting}
> +
>  \subsubsection{ISR status capability}\label{sec:Virtio Transport Options=
 /
> Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
>=20
>  The VIRTIO_PCI_CAP_ISR_CFG capability
> --
> 2.34.1

