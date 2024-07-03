Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2116.outbound.protection.outlook.com [40.107.255.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545714DA04
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 06:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719989536; cv=fail; b=Fbqw04aa/UzHbx9ApkpCusSWPxZsA+jiEiShsWevGADDoxcLhrAS3TsiWUsQ2gHtD4pSD11erVwn9KsYHYUrxcdG8CRzrIYLb6fkS8hEAYJk7NDIS8TdB7LpumovJzHLbqJRizELS1ghj9al3AT35eRsYZhyCA/Wz8Dwb79wu2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719989536; c=relaxed/simple;
	bh=1WpnwPj+cUVUdrXufAms6RLAoVxKZ4eOgiiCWMWDeEg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nlC/vXLFYBasr8kB5Fo/8UN9l46mMJxHkwCesmQXs2K8idcQiQ2VAzUd89LM4TFkEhRZWs8ipI1kbf1eIeCVQvtBO0LBeW70kI37htP7jLe4wX6EsrTAP/cVINZ9/fe0VBDYgNlmG1MhnbqKNY0cyigF4h4zZtsEQYr5Ye2F330=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=JX8UQKtI; arc=fail smtp.client-ip=40.107.255.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="JX8UQKtI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTBc67H5pL2iwNa71mMSlMb1nyhLoL4+HkF+GtTvlGj3PfBgDSjlCxcTWS1aZFGQqg1m6dbDAWMf7Bm9GtlNik4CYF4aTOuv8TT9I93fRYfe+40zwHSkx96WLu9W4nA+cz29V7U95WI0PyKCqjYPzjvfYdlKubG/DqnnfAbQ2SNCQ56nyoNEVyYCxKyFhRjqF7Z4IUXp8hL6eHmqwXQFYWT7C6pwcvWmNF6jdVc0mZ42avPRSlk/KjVrVJTS3iHUWZHqpxYfo3gpWfHChzjytUbgtn8E9ef8RKfPRHbKeTKH/C8llmuBNZvEnbkPPWUfTjiyfkhEyGn5zwei072iSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvs7bim1QqfKn9NJqWdaqEWPdUWXVihETPerFd0PyH0=;
 b=fHoL9oxDzSk4Zu/cvncah0O0aFvygm0QVADwmhoSs8IfOOlROeWAQjrIKYrSIfa7+/eGpEuJ4dM0n4miQwfRqrtmjiHwaLaKCClv98+KYY8XNYNUdik7C2P4jq9MHbLy+81QMSGn1kArefgbuOHMn4MKy4xV3yYEpGXcVsdd03eUxC8x+z6LX/WoUt1egalZz96qqZ757xJvMXmHrI4LURR+HPvPh2XF1okFJTepFJphtfhwP14eiMIr4kwOLx6leWbSLiOZnbNEAiLCkTmQkqSNRwv+5dSXgABPPiq26JP476LHDrL1AhxyMQ4Xo5p+/t0FdzQAG2tDyvzW/OmF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvs7bim1QqfKn9NJqWdaqEWPdUWXVihETPerFd0PyH0=;
 b=JX8UQKtIxt230v67j9OvwWgpGBTv/gSgXmOVxSmLyY8vkxhBpFYfB4RSV3+s85EkbvVDXCg5BOBgvsXTvw9o80+O9aqmSIJERZc7W4yKvdqYvfLf7IC5CZL2x5XUb7TRQPjHl66fzGLNKyxgqMefD8JZlkrWrsTk81iVSRB34s/COFbE6T89Axf1WJhdqw3bz7QWS/4ApQxT42eg1KvcnpIdLOQNMZnIh3qB88v6gM1KRfx7DiNXsi7WV+DkylgkjnMo6ynZ2ERLiE3WIeUcNjap39SQK5Ngk4B8+lF1oJsI/N9bNfqpZbeq4OEHawh+TXIwrqWdEO3HIA+uZxL2Sw==
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com (2603:1096:4:1ec::12)
 by SEZPR06MB6351.apcprd06.prod.outlook.com (2603:1096:101:12a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Wed, 3 Jul
 2024 06:52:03 +0000
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd]) by SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd%6]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 06:52:03 +0000
From: Lege Wang <lege.wang@jaguarmicro.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "parav@nvidia.com" <parav@nvidia.com>, Leo Liu
	<leo.liu@jaguarmicro.com>, Angus Chen <angus.chen@jaguarmicro.com>
Subject: RE: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Topic: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Index: AQHay2kF67vqaBJYMUW1XCStKdNnOLHjWBeAgAEuLyA=
Date: Wed, 3 Jul 2024 06:52:03 +0000
Message-ID:
 <SI2PR06MB5385E3CEC459963A7D079B56FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <20240702073359-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240702073359-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|SEZPR06MB6351:EE_
x-ms-office365-filtering-correlation-id: 8bf50575-5130-45b4-27e3-08dc9b2ca57e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?pQnApGjjgdHLFTCFsgm80WHkgLUjfpj0/Om9oOq6NSqvtbJ7k8V57h+q?=
 =?Windows-1252?Q?BueISl2E8qdnfm7vp1mxVSoEGS5zSt1hEOg+YEwkf9h0vYnTiCq5kfkF?=
 =?Windows-1252?Q?8Nn/X+nW6/C5KirNqBZ59nKVCZ4wY6w6z+6aadLTpngbY4FbsjkKKP0C?=
 =?Windows-1252?Q?BNjGGY1GZydK4TAjet8O1BLQkduIQi/ec6oMsYR9iHQoZDPEygI8/vfa?=
 =?Windows-1252?Q?G6AKYgSs4OCqNRQql00W+7omjy1uB8nVIR/xdgxl/tcABlO99bZOIdaS?=
 =?Windows-1252?Q?6B3JmKpZTSdvwuns+TEJD6X7/qoA/yRxeN1iamQGGvubj9waSZIsx88J?=
 =?Windows-1252?Q?6VqnAmmq6cOHq54jB2MPMbeBh27c/x80cqHVBbFMf5C/hz9Rfov0KTq9?=
 =?Windows-1252?Q?nz/LRvkBX8sByok3oq9tJTT/Db2472Dh/LZtiWnxzoglbHkQPmBEd78r?=
 =?Windows-1252?Q?nIzMHKn6AqzIDLkydT8BhPSPmDXbmUZs2WIecsIE2yfs5DutiumUO1C1?=
 =?Windows-1252?Q?RUqVf0T51vMx6ZJfbPeGsRP/SuGgfxO3c1/1WAuJxPnp4HztxDqRnA8d?=
 =?Windows-1252?Q?2oIP4/Ieg3gTvVas9AaHANL9n0CeoQFNzBBiXt2l2S59yFdD3E/WnzqG?=
 =?Windows-1252?Q?rziUQiZdLnrR4Vq36KmVNGf8W7fkIOOZGrwsI+k8YNTxh2LR5Fm3VvP9?=
 =?Windows-1252?Q?+rSUcYzLXNAMbDeL9vx95lO5z3e9iBfVpakpIdVAIlyffXtPF6JehMrc?=
 =?Windows-1252?Q?eurzMRUaj9b7pb+J/eiZm8NG5OC55vf0nVolz06NcsMU/Qyg6hNSVoyY?=
 =?Windows-1252?Q?m43PV2FUs/9y/Opbc9/3OvWSFsmKDapAIdowyvey8GQQIULVw0HYAM1H?=
 =?Windows-1252?Q?icLStUyHzitHT6JL1C/P3gDb/+rXQAh8As4rHsSPu7nWfGhA+WzSvZC9?=
 =?Windows-1252?Q?Lvq5ime/0K0gPjvJOFcSJEfCQf9gYKA+7Oho0fSrGGjP4AdSj+9TQfqv?=
 =?Windows-1252?Q?wqFP7jZk5a3AjiU4N0uyCgO7bU0erqL7DbK2XvEvfOdw9mHviYZuFexg?=
 =?Windows-1252?Q?o7yukKkqMgV6/+HL+wc3fwnrZ8WH8CpdK6fKQrIfYSFv6Vv27oqRBOIQ?=
 =?Windows-1252?Q?uy3/eUaF86X35WdrPZqC6eOtX4WkGkCBXRgqk6yqAo8UzwLzXV3LOnI+?=
 =?Windows-1252?Q?KE3n5OUEtNSxzQqD54OnUwEBo8c1+S5bqVXH/L6owwbxwR3ZbUcX26YY?=
 =?Windows-1252?Q?sjO1V1Z7H4Cz9/6NwCRDKdTyElMMYrz98Ivnj8ZDHVPjEyvaaGHokjLY?=
 =?Windows-1252?Q?F7LSKfTSkD4IoI+sDOLMVKWsMuE0KFg79HXGDCHLVrTGVSAs1Bf/mtQC?=
 =?Windows-1252?Q?zOB4k+wjaTj4lUMGvTn3Ih/K7BALulXa3HNgWI7FW+ZmOJjDoFi8Uy0V?=
 =?Windows-1252?Q?VSNVzpLHN7I0MvYOI4px8etKd+XmC7ug93k8eZ3WNVY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?m3gUYAU+3zJfU35JHemxmJtVo3IlHvh51MAEFB5Xp/E9TlJbTKIfMiEP?=
 =?Windows-1252?Q?SYofzA0B3QhK1gW09GOwzJIOH1kTyegcZSrtB+VrwspdN8DfKPQbEcte?=
 =?Windows-1252?Q?kioT1xd5BFTsDSUhcofwnb7jcqLldQPq/HkZz4a9q7wdNa7ArIvob2PS?=
 =?Windows-1252?Q?DGvDoB/ZhekBh2AK48pNvkmeMZM4KN/ptRiOqBi6G0PClXw5YS1TWwaR?=
 =?Windows-1252?Q?AagLkvgCb2SzQutbzNbaynbeNtZfWEIMRXbzKHOZX25meyHrdydfY+j9?=
 =?Windows-1252?Q?9Iz79+8JBRJ8iqImVC7vF08UYI9O8y43/0eGvF1h3mgYGHtsiWHOYH9V?=
 =?Windows-1252?Q?D3h2pdPbdZdBpKr9Xgt7PLCS1eECBiUpstVeOpXeeTOKJ1TbXumoCCxy?=
 =?Windows-1252?Q?fGKjdtio15FswvzmbhwakQngSyYGrFNw9fnZ8ooTe4FO2q7UZbm3XMrl?=
 =?Windows-1252?Q?Vhu0kbSA2It1MXbyJ8WQKbhvA2T8k8Xco5qD4v19fFxVoemP7MdoZgx4?=
 =?Windows-1252?Q?wmcE1SZ5WmrLDq6u25Bn5I4iAqLPhAN8/jSmxINkPuUxpkVukQ8oNZLK?=
 =?Windows-1252?Q?7hkNLXfbfK8UuGEr2kwFmplIuCKT38tkrowMoe1R3JvPPsb4ybrecDhf?=
 =?Windows-1252?Q?HhZL33VOIiTIUwFnYPG2Nz1D0vRzB5OfLbPbfcUYBH00fP52biR2NC+E?=
 =?Windows-1252?Q?ecsHDwGDHIxrh0Ab3Dl+YldPIHZzXEoAKDpuQDJPzRip07v/fLh19lHs?=
 =?Windows-1252?Q?9ur9RmeqDwLeYqU5XDGIhjRg6OdW+8xd1yD6JSwC5IO+3SpAMCxQiDND?=
 =?Windows-1252?Q?ZhCpuObjY2/9r70Kp8KHtHsuUW5J3rT2ICgRBEe+TEO8MHdCKZyddLOn?=
 =?Windows-1252?Q?9RzmuBlLzd+UJLT9muzdPSOqv7R/FUQWuyDcgNW9QgXJelmeYZPvMUAn?=
 =?Windows-1252?Q?BI0e0qTR9RansaA+VBQ5XjumMJFGSHXZIP+oRr6o3JLw51l1RL98erCH?=
 =?Windows-1252?Q?NwFvaQYpIF2IbRZT/3f4NGkDsUPNJIw4wkR+OHT6eR31qCz6x8OBEceM?=
 =?Windows-1252?Q?RFAnJ/YXcvYgW2kRaFxx/5S5u9RALMR9SedQFwIZK5TPpHxQqx3+f7bo?=
 =?Windows-1252?Q?TalkAbhAvN1Bmxk6z0aVVVSv6N27Q5R8ZYiT4a8iIREBR+5VK7F7ra/i?=
 =?Windows-1252?Q?xTRMz00pv6VlKt9bw3zaXB0b7yHhoYKO6BQmq9WtRwKEJIuHVvfagdzV?=
 =?Windows-1252?Q?8Q1BerI7V6acvm4+hTvPMVP2a7/WYMY16ticMVf84UW6J+xN+Wb59MSX?=
 =?Windows-1252?Q?4LNNu3MVGHMER/vw/V/wzmheDehVYcG38WCxk/9j45ghxE6JMWRc+qv5?=
 =?Windows-1252?Q?bArzFPGZWgunHEqUzgH1jN3vkQyl7rOfBnJCVZ4kgFwzep9gbAMU8jxy?=
 =?Windows-1252?Q?gc5SRUTdkx/LaxEzoTIo790A9bEqBZ987w3vdTOCz7w5O3Z5YfQ30u5V?=
 =?Windows-1252?Q?EX+HX8geHc8NpS2kpbzy68A/ZcJ2iIDZzYf3/J7SrBUXgYhUNzw5IeLc?=
 =?Windows-1252?Q?VbwfZIWgKmjh10b6G3yFG3EtGMmfc1trjYXZYIrFUoY3bimXyXjsgcKx?=
 =?Windows-1252?Q?9cNV2cLN0hpVoarLQnfC/aZVYBy87p5lRtdPEwqBoD8Rbzt+4dl6Tvmv?=
 =?Windows-1252?Q?aWP6XydO1W9y7LkXWohyFbaWLHgudC+6?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf50575-5130-45b4-27e3-08dc9b2ca57e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 06:52:03.6960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PlIbNFTtcC98CYTj0sC8qrgxDK2TEOs+V5nPlznycENF7GPQHyvRp4NKeY/JsfddWN6oQprtiJo+EuibNurv3t3/dyIJaJiEdgWpRTMrpzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6351

hi,

> > +\subsection{Used Buffer Event Enable Notifications} \label{sec:Basic
> Facilities of a Virtio Device / Driver notifications / Used Buffer Event =
Enable
> Notifications}
> > +This kind of notification is only necessary when
> VIRTIO_F_USED_EVENT_AUTO_DISABLE has been negotiated.
>=20
> This is not how you start a section. Some text from commit log
> might be helpful here.
OK, will add some explanations in V2.


> > +\item [enable_notify] Whether to enable used buffer notification.
> > +      The driver may benefit from just informing device the latest use=
d
> ring entry
> > +      it has processed, but not enabling used buffer notification. Thi=
s field
> only
> > +      occupies one bit, if set to 1, it will enable used buffer notifi=
cation,
> otherwise not.
>=20
> not what?
Not enable used buffer notification. It means that if enable_notify field i=
s
zero, only info about the latest used ring entry the driver has processed
is passed to device, and device is still not allowed to send used buffer no=
tification.
>=20
> > +\end{description}
> > +
>=20
>=20
> I don't really understand what is this list supposed to mean.
> You seem to be defining a bunch of fields which are never used?
>=20
>=20
> Wouldn't a better way to put all this be to say that
> the driver sends a copy of notification suppression
> info to device?
> In case of split - flags  + used_event
> In case of packed - struct pvirtq_event_suppress
Sorry, I should write as you suggest, will improve these descriptions.

>=20
> > +  Note: when VIRTIO_F_RING_PACKED has not been negotiated, the
> maximum queue
> > +  size MUST NOT be greater than 16384, when VIRTIO_F_RING_PACKED has
> been negotiated,
> > +  the maximum queue size MUST NOT be greater than 16383.
>=20
> This is not the place for this kind of note.
Ok, seems they should be beside above used notify suppressions descriptions

>=20
>=20
> each term has to be first explained, then used.
> you never bother saying what is "Queue Notify address for enabling
> used buffer notifications"
>=20
> > but add a 4 bytes offset:
> > +\begin{lstlisting}
> > +        cap.offset + queue_notify_off * notify_off_multiplier + 4
>=20
> quite a hack. why not just a new capability?

Parav Pandit had suggested to add a new capability in my initial RFC patch,=
 and Initially I also
intended to add new PCI capability to describe this new notification area, =
but found that this
new capability would be similar to virtio_pci_notify_cap, and will introduc=
e many duplicate
descriptions in virtio spec doc. If we choose to extent current notificatio=
n area, there're no needs
to touch current pci capability, the corresponding queue notify address to =
enable
used buffer notification within a BAR for a virtqueue would look like below=
:
  cap.offset + queue_notify_off * notify_off_multiplier + 4

See https://lore.kernel.org/all/SI2PR06MB53850CBD8F76EDC65DF2DD38FF7C2@SI2P=
R06MB5385.apcprd06.prod.outlook.com/

Anyway, I'm ok to add a new capability, which will make the logic much clea=
ner.
> > +
> >  \subsubsection{ISR status capability}\label{sec:Virtio Transport Optio=
ns /
> Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
> >
> >  The VIRTIO_PCI_CAP_ISR_CFG capability
>=20
>=20
> After reading this and the text, I can't figure out how is this feature
> supposed to work without races.  What if the device uses a buffer while
> the driver notification is in flight to the device?
Hmm, I think it doesn't matter, Only the used buffer enable notification is
transmitted to device successfully, device starts to judge whether it's tim=
e
to send used buffer notification to driver according to its internal interr=
upt policy.

Regards,
Xiaoguang Wang
>=20
> > --
> > 2.34.1

