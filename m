Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011057.outbound.protection.outlook.com [52.101.52.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBA422129B
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772030743; cv=fail; b=RW/NfgZAewE3SME/XcHjkBErmcxzCrkj6e3ZZdeUjqcyNcS7em5zRyZDJU4EMNesmkIq02SAlBj194J67JNXwzvUgWLIF6XOlyIc8xTA5KGFkNWjYHiyPTlaDYSlndeqRxj511znHPPXwN6hTwXYwG2WXmwWoHhe3hfX5hPtwn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772030743; c=relaxed/simple;
	bh=Jjia2sluEEp/Y5M2BhwPvT6WM1KECK7EicNbYM7og+Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lu+iIBeZQaFVn0RtNmVL/DfZcVkVM3Op0CJjAaHr/cQ0IDaXGDoCL3xMxs8fgpQ9eFWsrNdk4HekNtVxtBiuuqF5eZeUfUi3w1akO5g1vCeslagebc5gwxPgMAbVpq0waHtIXnsQMgaT8jDKorq3uTteRneozr8rpRXAUv8wgHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ixjkdm8d; arc=fail smtp.client-ip=52.101.52.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ixjkdm8d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0hT2K8Ayy+OrUle6YZMeF0Et3BbLM/zlBy1TxwW6dayrbjFmfKPafnOJ39+5uS0+L45jZlLbhDczZlNIWuWqmhR79IRffKU25W+N535KwYkKI5jVkfLnQtTgxSN/+4bSCWGQRCh2YLDPrZHZ1nAhDR6Cd2tEcdrHy3cFRQigxhkkbD+ngrJIFL5TyXpB+Tnpf/Wu4qZ8zAazMp6ko9E6gsgdDQo8N3OH56nwSXUqquOfiqvwOqRIVtf0xPtak6VBlht62w1iuAP5DhLkBozdzM+3e9IhpDoAkpr9yIJuwBFGryiYWuWsmq2fRfyppt2uLqbywA6IwidTWKrE03nwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jjia2sluEEp/Y5M2BhwPvT6WM1KECK7EicNbYM7og+Y=;
 b=HpTEX00YCamWhe7b/oWKTCxSjQQX/sOqPnnQ52qpY++n5dOu1fuhryCzpdkL48ApNueh1YLV/Z6Odk1ID+n0eGCCHxblbFsGWW8NDiP8nABn95O07voMQRfwHtZkvQSs5SIBi413MHDvNyy094vIDYMKBGzL2a3slyvP7tHbA1DKwT4NF+QtMkhf5Ugf152XNTZ+adYKCur3tHZAaiMkTkLbbOlc7hS27QuD/iqxs8jQ099kPrRafHpqUVo/t9ApVK45mzQiWnDjbHAMRp/pPpUi91XuSu6ifF1ZDgKrgcBY7lD8S1EXmIRGiaBs6s2n6zmoTbdH5DjAkYlpMPrbcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jjia2sluEEp/Y5M2BhwPvT6WM1KECK7EicNbYM7og+Y=;
 b=ixjkdm8dC6uHDPljAxzXqprf/c393jGBKeGETqoAk/xPW/MWsqhUSZN+V/hR0w3Oj1eP8hdcGiWAdMP37mfEsdQw39sV3ETFBmHNzWtf4AdIrBO2xwDN1kurdhK6d3f1FUKowOBmQTMBKN2Yj8GCcNFf3CYYbS0QIVWhToVfn64C/46y8wEKVXRcNBcRwjglqn09OkqnUBJIjTG/ht7AG79qHAA/ebNqZYvL/K5F8Cmklk33vrrHlDbuv1ZFADZeXOm1zu7P1I2cYbPK1dw88se1EPTrGRe6EVJawg3KniK0qiq8tabSJDu97wtq8GcKTPKov0JSLPXsvXrGZGDXXQ==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by DM6PR12MB4452.namprd12.prod.outlook.com (2603:10b6:5:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 25 Feb
 2026 14:45:35 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%6]) with mapi id 15.20.9632.010; Wed, 25 Feb 2026
 14:45:35 +0000
From: Parav Pandit <parav@nvidia.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Manivannan Sadhasivam <mani@kernel.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: RE: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFu3dyU46FhXkWSoPS8nyUxT7WAvzgggAoZRoCAAGdhoIAAMZEAgAfGMQCAAAUmAIAAIlAAgAACG8CAAAYFgIAARRCA
Date: Wed, 25 Feb 2026 14:45:35 +0000
Message-ID:
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
In-Reply-To: <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|DM6PR12MB4452:EE_
x-ms-office365-filtering-correlation-id: 0e8d39a2-b99b-4518-c9e2-08de747c8918
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 vCUzUKMK9AeF6IEopMHKzqDRxuBsCxIe9BCl0ACejpwhnZTD3NYkb7iZun4d+QmrpUXvkBuden21+0znRSYF7zJbxdqdsogRyW/XXMwtmvupgSYthCYXI2LE1nRw4Xghbq/avQXV5KPT0C8UwfXTH4k5ZisPkLMmuDx8/hJ4QNGlPqV27lx1pTjB9TIlts8SI/9+YDXcJhTaCzD/wHoTA1lFwA9gZyXWKZk8hBeAjkknuD5QbkDsoJT/XvkifnFfUoIAxdw0OXVpzMceTwj3XmTQufAE1ayjALObBgAEM/QqZcx0iLeVZiqOXOg0fpWX0/mtHAUa8l9AX823cz9/KP79OjOCEbq2kCwul+7/wSJ60pDH3f1fLIeJQqmIrZAuh64RSFHnDSNkS19On5p3grmONJRIt/dkfVxb34Kie1AJSl4SW7U/7wpN0eDVpWpSnnKVZ/TbDOlNqI6/Vf+52y4g4HcfMuYhf6rN8HRdv1e84dIjS31zqXtwr+n/H9jf5mn6c15i1yrVU8m1s/XmpKLqfXG2ZFKzvYqr6KFL1kjRUoJd471vdUD1CmgnEcG0GLeigkuW1LVnF+BwFVHWKM9tAtEyYLM1XLz35eNlaVtAnFt+HkYnkX9CDv+4SWWTs1/EGhQog52ObVaI+6K4bNqsgRf0pMjzqdyjxZ8FkkVpKiYhXZ8xX+9Roi8uaMkD6m1Onl4mi2pRxDCHehOilEbqAS91z2D/II7YKehHIdsFHpDgr+9gd+HJGvT0IB2nmWjAMdRdzTDacnOxc8TWB5d9U3sr3MFxZRlnXlx8Iq4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?X9ua/zjzVBGUv63aDbS8cxyeqEhLw146YSG7f5kpTH5Qx0jfbXdmBuYdPE1p?=
 =?us-ascii?Q?5jEruwxzIk3Dh/D5fVqyY7S/uCGE5Axv7chBiOFlo67dDIddXCbsG9IbaVZn?=
 =?us-ascii?Q?lRVDBJsPTOH3D9p11KfUJu6gEXt+qUKP8LzD1rJvFVDVJEgtlf9NFFLwIpma?=
 =?us-ascii?Q?p3O76V364mxsnF1qkUN4yB8Wvmt8GZPH8kGGnKRD0IgUwNlM7ZAJ9knc+/Vp?=
 =?us-ascii?Q?QqmH/H/gA9vsHj8rbgGdprT5yzVwD1CG7Dd4FiHjytzRAwhsbn9dt+cPo9Qy?=
 =?us-ascii?Q?YeU7VMfNrIfjgYMRX5QS9SMdAHZ07bhatH+2ZUfhQ1i6ocxsYWSV+NgE/TiU?=
 =?us-ascii?Q?Z9DH04ZBDDXLjTltaPEehgMS1BG1uTSVQn4iLYB+a1/mNqPOAaFR0PhALHNd?=
 =?us-ascii?Q?KqMFXVrfmn7GDX/fOE+MdcxfvU4KvZzoyjg0MH4cO/4RlVr+3ETGiJ0lCxzg?=
 =?us-ascii?Q?RDY1VM3myiQm2ew/zTR7Vbb8gZdj5p7oooBNRqL3GO84o0r88IYXCuPxkS9F?=
 =?us-ascii?Q?IUQlu6c1bh+ZGv0uENGo/7QAwg3jwKgC9dbHUhapyF0p+g9hm5ZkadFkptgC?=
 =?us-ascii?Q?H2IpI8W34N1VIyI9D5Y1GMNox2Zk9gwyHEjTH6RrHgZdnALnmETTiiXlDDMU?=
 =?us-ascii?Q?kM8zxdoWegIwNrwYZPOG1uAmS3DjDZNopx17tBO5NEbbcaYIqwz8v3GPlFn/?=
 =?us-ascii?Q?4RTYpfPfkHX0nTVCFjVeOWgAU1/D8VbP9JF74/b22hD/bRHir/vaXRsAt/zC?=
 =?us-ascii?Q?nUJyOEZwbuyVmXEfA2elXay1lwybm48u5AenSJ/DC7Ip95kcqbkDfyQZBtCl?=
 =?us-ascii?Q?Z5eOXGMWfs2SelsuP3CBbKfzomi+Rz9566AbwdPW1XfUwPfFqlMLcgaYT4/3?=
 =?us-ascii?Q?wa8wfK5MqhAmJqSsUr8taDViaq5vPj/TF+cq0JFglgxTW1w85IF8PXWuATPS?=
 =?us-ascii?Q?pneJvqM1F+wrLj3ax+B8g5SV3yiBDm1EwiG+reydhxviLiRVrdAs3tilhYip?=
 =?us-ascii?Q?KoVaR/slVPDJQOPSv0rSl6RQ0FWnVBNfTuvId+zhgAVw079KD7/kPNSKaymY?=
 =?us-ascii?Q?uaFe+F2tQ1U26tqAq5BcqmIeU1jtu3yHVMVGzd07EepXVR8uJK3ckfEDJqZm?=
 =?us-ascii?Q?Jiw2yYxYKJ9T94nHHijst9111WZjJVIZi+B1NC1CO4zvqNCEtjtAoUdVH8dh?=
 =?us-ascii?Q?dQvYrKCdgLgG1tzt5A4Itt7patZ+m7B3b7ycK1AqhOw5GsuGhnLsgsm8EeDC?=
 =?us-ascii?Q?wAPsSvEGiTHOo6FJtQyfkxIDCF81EXOj4PsyHvsGGAMS36XqMCEZkBVFM9hG?=
 =?us-ascii?Q?Nl7KKxUabHU2mWjUNQYXdG+10amd+57AVbRtLRtPmcz5ZbMjHcUL6rgJ2iuf?=
 =?us-ascii?Q?rXrlakqhzIM+kSX5tZigXWoznYRpQXMYZQjks+4SCvQjkiYFomjffqZf70eK?=
 =?us-ascii?Q?AoybnFB5nQzTe8m4/t7Ez+w2OzOQAe5i8VdAyEJxZx2N4iEvrc5z/IeEOvJK?=
 =?us-ascii?Q?kTrQY9MVcG+bXvjr0CqnXJg8E0IoJqN8XBsOX7DcjB5ojxXQqSk2bDRE0L46?=
 =?us-ascii?Q?EZA31aBF760lLh3wZ1dt1d6QImo3W4tBJYa421tb6fPmMliSKQwnPCBBbivG?=
 =?us-ascii?Q?ZTGI+vDYXCHXLoLXFP5v5Czwpa1XKuqLcJRdNsm/xMv2zHwsqhsUP7LM6TBs?=
 =?us-ascii?Q?Xt7cGXXkkl+565bUc+lfSp4p+dIIQvCTMKlt0FnfZ32Om7RC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8d39a2-b99b-4518-c9e2-08de747c8918
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 14:45:35.7216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cOW+qNppUlWJYz/dfOoHZ37bPaOxwcF/Fx2mPTGhzYCMLy3wX1VUufOS8Rv4dQNcfc37yxExlKXPD2LNz0H3UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4452


> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Sent: 25 February 2026 04:06 PM
>=20
> Hi Parav,
>=20
> > On 25 Feb 2026, at 11:24, Parav Pandit <parav@nvidia.com> wrote:
> >
> >>
> >> From: Manivannan Sadhasivam <mani@kernel.org>
> >> Sent: 25 February 2026 03:37 PM
> >>
> >> On Wed, Feb 25, 2026 at 08:03:48AM +0000, Bertrand Marquis wrote:
> >>> Hi Manivannan,
> >>>
> >>>> On 25 Feb 2026, at 08:45, Manivannan Sadhasivam <mani@kernel.org> wr=
ote:
> >>>>
> >>>> Hi Bertrand,
> >>>>
> >>>> On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
> >>>>> Hi Parav,
> >>>>>
> >>>>>> On 20 Feb 2026, at 07:13, Parav Pandit <parav@nvidia.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>> Sent: 20 February 2026 05:25 AM
> >>>>>>>
> >>>>>>> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
> >>>>>>>> Hi Bill,
> >>>>>>>>
> >>>>>>>>> From: Bill Mills <bill.mills@linaro.org>
> >>>>>>>>> Sent: 26 January 2026 10:02 PM
> >>>>>>>>>
> >>>>>>>>> This series adds the virtio-msg transport layer.
> >>>>>>>>>
> >>>>>>>>> The individuals and organizations involved in this effort have =
had difficulty in
> >>>>>>>>> using the existing virtio-transports in various situations and =
desire to add one
> >>>>>>>>> more transport that performs its transport layer operations by =
sending and
> >>>>>>>>> receiving messages.
> >>>>>>>>>
> >>>>>>>>> Implementations of virtio-msg will normally be done in multiple=
 layers:
> >>>>>>>>> * common / device level
> >>>>>>>>> * bus level
> >>>>>>>>>
> >>>>>>>>> The common / device level defines the messages exchanged betwee=
n the driver
> >>>>>>>>> and a device. This common part should lead to a common driver h=
olding most
> >>>>>>>>> of the virtio specifics and can be shared by all virtio-msg bus=
 implementations.
> >>>>>>>>> The kernel implementation in [3] shows this separation. As with=
 other transport
> >>>>>>>>> layers, virtio-msg should not require modifications to existing=
 virtio device
> >>>>>>>>> implementations (virtio-net, virtio-blk etc). The common / devi=
ce level is the
> >>>>>>>>> main focus of this version of the patch series.
> >>>>>>>>>
> >>>>>>>>> The virtio-msg bus level implements the normal things a bus def=
ines
> >>>>>>>>> (enumeration, dma operations, etc) but also implements the mess=
age send and
> >>>>>>>>> receive operations. A number of bus implementations are envisio=
ned,
> >>>>>>>>> some of which will be reusable and general purpose. Other bus i=
mplementations
> >>>>>>>>> might be unique to a given situation, for example only used by =
a PCIe card
> >>>>>>>>> and its driver.
> >>>>>>>>>
> >>>>>>>>> The standard bus messages are an effort to avoid different bus =
implementations
> >>>>>>>>> doing the same thing in different ways for no good reason. Howe=
ver the
> >>>>>>>>> different environments will require different things. Instead o=
f trying to
> >>>>>>>>> anticipate all needs and provide something very abstract, we th=
ink
> >>>>>>>>> implementation specific messages will be needed at the bus leve=
l. Over time,
> >>>>>>>>> if we see similar messages across multiple bus implementations,=
 we will move to
> >>>>>>>>> standardize a bus level message for that.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> I would review more, had first round of sparse review.
> >>>>>>>> Please find few comments/questions below.
> >>>>>>>
> >>>>>>> I'd like to comment that I think it makes sense to have a basic s=
imple transport and
> >>>>>>> then add performance features on top as appropriate.
> >>>>>> Sounds good. Simple but complete is needed.
> >>>>>
> >>>>> Agree.
> >>>>>
> >>>>>>
> >>>>>>> So one way to address some of these comments is to show how
> >>>>>>> they can be addressed with a feature bit down the road.
> >>>>>>>
> >>>>>>>
> >>>>>>>> 1. device number should be 32-bit in struct virtio_msg_header.
> >>>>>>>>> From SIOV_R2 experiences, we learnt that some uses have use cas=
e for more than 64k devices.
> >>>>>>>> Also mapping PCI BDF wont be enough in 16-bits considering domai=
n field.
> >>>>>>>>
> >>>>>>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data tra=
nsfer.
> >>>>>>>> For example, a TCP stream wants to send 64KB of data + payload, =
needs more than 64KB data.
> >>>>>>>> Needs 32-bits.
> >>>>>>>>
> >>>>>>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMO=
VED (instead of READY)
> >>>>>>>> But more below.
> >>>>>>>>
> >>>>>>>> 4. I dont find the transport messages to read and write to the d=
river memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
> >> operate
> >>>>>>> the virtqueues.
> >>>>>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and respo=
nse?
> >>>>>>>
> >>>>>>> surely this can be an optional transport feature bit.
> >>>>>>>
> >>>>>> How is this optional?
> >>>>>
> >>>>> As said in a previous mail, we have messages already for that.
> >>>>> Please confirm if that answer your question.
> >>>>>
> >>>>>> How can one implement a transport without defining the basic data =
transfer semantics?
> >>>>>
> >>>>> We did a lot of experiments and we are feature equivalent to PCI, M=
MIO or Channel I/O.
> >>>>> If anything is missing, we are more than happy to discuss it and so=
lve the issue.
> >>>>>
> >>>>
> >>>> I'd love to have this transport over PCI because it addresses the sh=
ortcomings
> >>>> of the existing PCI transport which just assumes that every config s=
pace access\
> >>>> is trap and emulate.
> >>>
> >>> Agree and AMD did exactly that in their demonstrator.
> >>> I will give you answers here as i know them but Edgar will probably g=
ive you more
> >>> details (and probably fix my mistakes).
> >>>
> >>>>
> >>>> But that being said, I somewhat agree with Parav that we should defi=
ne the bus
> >>>> implementations in the spec to avoid fixing the ABI in the implement=
ations. For
> >>>> instance, if we try to use this transport over PCI, we've got questi=
ons like:
> >>>>
> >>>> 1. How the device should be bind to the virtio-msg-pci bus driver an=
d not with
> >>>> the existing virtio-pci driver? Should it use a new Vendor ID or Sub=
-IDs?
> >>>
> >>> One bus is appearing as one pci device with its own Vendor ID,
> >>>
> >>
> >> What should be the 'own Vendor ID' here?
> >>
> >> The existing virtio-pci driver binds to all devices with the Vendor ID=
 of
> >> PCI_VENDOR_ID_REDHAT_QUMRANET. So are you expecting the Vendors to use=
 their own
> >> VID for exposing the Virtio devices? That would mean, the drivers on t=
he host
> >> need update as well, which will not scale.
> >>
> >> It would be good if the existing virtio-pci devices can use this new t=
ransport
> >> with only device side modifications.
> >>
> >>>>
> >>>> 2. How the Virtio messages should be transferred? Is it through endp=
oint config
> >>>> space or through some other means?
> >>>
> >>> The virtio messages are transfered using FIFOs stored in the BAR of t=
he PCI
> >>> device (ending up being memory shared between both sides)
> >>>
> >>
> >> What should be the BAR number and size?
> >>
> >>>>
> >>>> 3. How the notification be delivered from the device to the host? Th=
rough
> >>>> INT-X/MSI/MSI-X or even polling?
> >>>
> >>> Notifications are delivered through MSI.
> >>>
> >>
> >> So no INT-X or MSI-X? Why so?
> >>
> >> Anyhow, my objective is not to get answers for my above questions here=
 in this
> >> thread, but to state the reality that it would be hard for us to make =
use of
> >> this new transport without defining the bus implementation.
> >>
> > +1 to most of the points that Manivannan explained.
> >
> > The whole new definition of message layer for the PCI does not make any=
 sense at all where expectation for the device is to build yet
> another interface for _Everything_ that already exists.
> > and device is still have to implement all the existing things because t=
he device does not know which driver will operate.
> >
> > And that too some register based inefficient interface.
> > Just to reset the device one needs to fully setup the new message inter=
face but device still have to be working.
> > That defeats the whole purpose of reset_1 and reset_2 in the device.
> >
> > This does not bring anything better for the PCI devices at all.
> >
> > A transport binding should be defined for the bus binding.
> > A bus that chooses a msg interface should be listed that way and bus ch=
oose inline messages can continue the way they are.
> >
> > If we are creating something brand-new, for PCI the only thing needed i=
s:
> > 1. Reset the device
> > 2. Create an admin virtqueue
> > 3. Transport everything needed through this virtqueue including feature=
s, configs, control.
> >
> > And this will work for any other bus or msg based too given only contra=
ct needed is to creating the aq.
>=20
> I think you misunderstood a bit the point of virtio-msg bus over PCI so l=
et me try to explain.
>=20
> You see one PCI device (regular, not virtio) which is a "virtio-msg bus o=
ver PCI".
>=20
> When the virtio-msg bus over PCI it will communicate through this device =
with an external
> system connected through the PCI bus.
> The driver will enumerate virtio devices available behind this bus and re=
gister them so that
> the corresponding virtio drivers are probed for them.
> All virtio-msg messages required to communicate with those devices will b=
e transferred through
> a FIFO stored in the BAR of the pci device and standard PCI DMA will be u=
sed to share the
> virtqueues with all the devices on the bus.
>=20
> So the PCI device is not one virtio device but one bus behind which there=
 can be many devices.
>=20
> Is this making the concept a bit clearer ?
>=20
Yes. This makes a lot of sense now.

This is a virtio-msg-transport device that needs its own device id in the t=
able.
And its binding to the PCI transport.
So that device producer can implement this standard device and driver devel=
oper can develop the driver for multiplexing by reading the spec.

> Cheers
> Bertrand
>=20
>=20
> >
> >>>>
> >>>> And these are just a few questions that comes to the top of my head.=
 There could
> >>>> be plenty more.
> >>>>
> >>>> How can we expect all the virtio-msg bus implementations to adhere t=
o the same
> >>>> format so that the interoperability offered by the Virtio spec is gu=
aranteed?
> >>>
> >>> We spent a lot of time thinking on that (this started around 2 years =
ago) and we
> >>> discussed several use cases and did some PoC to try to have everythin=
g covered
> >>> (secure to non secure and vm to vm using ffa, system to system over P=
CI or hardware
> >>> messaging system, PCI, Xen specific implementation) to check the need=
s and try to
> >>> cover as much as we can.
> >>>
> >>> Now there might be cases we missed but we think that having a purely =
message based
> >>> interface between the bus and the transport and split responsibilitie=
s the way we did
> >>> is allowing lots of different bus implementations without affecting t=
he transport and
> >>> driver/device implementations on top.
> >>>
> >>> We identified that a common use case will be for the bus to transfer =
messages using
> >>> FIFOs to optimize speed (at the end you need to have a way to share m=
emory between
> >>> both sides so why not using a part of it to transfer the messages to =
and reduce the number
> >>> of data exchanges and copies) and this will be used by PCI, Xen, FF-A=
 and others in
> >>> practice (so we might standardize the FIFO format in the future to al=
low even more code
> >>> reuse between busses).
> >>>
> >>
> >> Not just the FIFO format, but how that FIFO gets shared between the de=
vice and
> >> the host also needs to be documented. Maybe for this initial transport=
 version,
> >> you can start with defining the FF-A bus implementation?
>=20
>=20
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the c=
ontents to any other person, use it for any purpose, or store or copy
> the information in any medium. Thank you.
