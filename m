Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2A2176247
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718096102; cv=fail; b=gvXOahuxz4kZ2I/9vD8mUbc7O/7WW2wKSNO0wXrpaIvP9xGg43MWNBCv1q7dFBnLGpANX+lefUWdVXrYJxxZxdgRfPMy6ylQ64CwaoxuKLTUjr45TeubOVVhPyagB4jrYjHuOdSYYUssJ6VoKwQB0vv9h9dxQwIfWlc3bAwMjCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718096102; c=relaxed/simple;
	bh=NKfOIwKX4P9ZLDI8QA+vqBSaU7h39UhJqKrb+1PPpEo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IQtWc2HArVV+Q+DuL2OcZURZR7LstCTwqrBJ9C6m9XGP0YR4cO104uQw5uHmD+2FT9k6oYdg0UiLlUhEjhzqqEBnc4BpVGyVv6L/CFKVHyE2BmQmgpGHNIf+OMvguz3oJmKgrMbPlecUGao56+4cdPrg5MEptuMA5ikWHnkvfRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ifmh3vkD; arc=fail smtp.client-ip=40.107.243.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ifmh3vkD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gymNMUjyqjlCjol+EWXD3PNjtqwSMsw20UMzV/RJhHoD4/m23dGtkexlpi+GMrE2Zo5fY7jRvpk2iYbWjD0/oS0OMnRCYYH3kHrEOQ23+q9Gue6edl8nF7SUQQm6qOoMOsaz1V+gyf7pCcH4Hl9ENz4QcK6aWnf/45UvXLi7DVJIYO2s4kUJ+b+6UtoaTX6kx4rnxZ2HoaFm8qoq+uzmnQn5qHICc+oS73FfkORzcx57zKQCl2seJScsepxmDnxkbC8w2mGJJ3N389yresjXpcXtx1frJHDstgcAh1uVG8rsfUOUA/WkgJc0TweWGHJswQw0P+K3r/HJTwlwHwK65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKfOIwKX4P9ZLDI8QA+vqBSaU7h39UhJqKrb+1PPpEo=;
 b=DjKukKK3mH6xQa/0BEX+URkS/TreXL9x9p6VS0yJx/iqDC+ppyMMQQPHGZh2bR2phpcbBfWrhaL5N5mv6Jzywk8gXTWwADgS3bKjzD1TTFfG+842MHimRehXAENmq4mHMpeizErUZbgAQlDAIPjcKIK93DKiAf3c8tE1j9PgvJDhq7JsZpLQmkRSw071AqoQmb01lpKjM6ZM+SahACSiamgJeMuYDqmskzVrApw3nb2MSSUMAfBxOKmFPy8E/jI5NFjN7Kq70Ztz52BSjM0RChdzsJkqiVlWhxrxT4EIrtnr/7gu4gVr4B4diXCzdloI9FdD3cy/FSNZig3gBSK/2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKfOIwKX4P9ZLDI8QA+vqBSaU7h39UhJqKrb+1PPpEo=;
 b=ifmh3vkD3s5M2np5Pb/0iv4TbMT4RAG6mge7Xeh3eBS9uQI1+OW7rYW/1JSwdsrJhR9XUwAdn5KnyARa3GqTVRdKICuzQJ+Vl6w6+0uiccTWAV4vwxBSTXq//MqgC7PLEInAmyRBoWwrCjSqNne9uN4Si9r3GeHUMzWwmNyWrtcQu3WsYFZeiwE4S7+l1yzPK35fFjIg8gQ38lAXgDsoWJ/ieZTbmwoVrvxU7WXFevOmhtXgLpclyWECznfvpk2gp+D6fHlAxhcbbWwQ3CDBqoU9KvZs2GX6/NcsbDGEtp4hoywknItkro6dTmDtI9Ssi9TIQx/6MzfhESxRXighoA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SJ1PR12MB6099.namprd12.prod.outlook.com (2603:10b6:a03:45e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 08:54:57 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 08:54:57 +0000
From: Parav Pandit <parav@nvidia.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Vincent
 Guittot <vincent.guittot@linaro.org>, =?iso-8859-1?Q?Alex_Benn=E9e?=
	<alex.bennee@linaro.org>, "stratos-dev@op-lists.linaro.org"
	<stratos-dev@op-lists.linaro.org>, Manos Pitsidianakis
	<manos.pitsidianakis@linaro.org>, Cornelia Huck <cohuck@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH V5] virtio-transport: Clarify requirements
Thread-Topic: [PATCH V5] virtio-transport: Clarify requirements
Thread-Index: AQHau8GUIND+r1IV+UyIhrsUeJlUDrHCENgwgAARHACAAAmT4IAAEyWAgAACXdA=
Date: Tue, 11 Jun 2024 08:54:57 +0000
Message-ID:
 <PH0PR12MB548184F19F7FC9C9E45EC42ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
 <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240611065816.lq3ehs7fmpjbihip@vireshk-i7>
 <PH0PR12MB54815595D5B533A6E38636F2DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240611084103.3u7bsoe6nlr6xngf@vireshk-i7>
In-Reply-To: <20240611084103.3u7bsoe6nlr6xngf@vireshk-i7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ1PR12MB6099:EE_
x-ms-office365-filtering-correlation-id: c3f7840d-ce84-4bd2-7ae7-08dc89f42b77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?XFw6jq+/pFe6IPZLOaBa/uJtGDDiBaQFMK/ydGlYr9hDFAWQTUP5onERCD?=
 =?iso-8859-1?Q?OEq7ji3CN2Zf2KOmGJSDCuGfNCbXfHQ0mr9ETqbvtsvmFvX1PZ0iKpPakL?=
 =?iso-8859-1?Q?baYyN0R1vsksuYa84aTf5R56WMcJsVdQxTuvsTkmRu5xYNMtlZOso3yJBr?=
 =?iso-8859-1?Q?DUTNRSUZworxIfuqlEQbSaHnlQdjw0WARe+LdDcLl6DfyqYytjvEwMdWJ4?=
 =?iso-8859-1?Q?YI2jVzvbksxJkgjzzewjRBbHkANX4C+8EGzcyPGYtUxQNJ2Q/ZHiZXjO02?=
 =?iso-8859-1?Q?9tCDP0sXAmQS0W6o5H642U7ncyuf+hZOMoJEMIhHbY6imnkruMm/AmO7q1?=
 =?iso-8859-1?Q?3cmCxXJuQxD6oTDaQZXAP12I3dGTA14vYWVp3SrXet2E7QDY1lmvFV1jd0?=
 =?iso-8859-1?Q?XloFQVjQvshb0jFdLNbyydr7ml0wD1cmqxTl1tEpJx976SDlbHJ6dakwiO?=
 =?iso-8859-1?Q?Dfu+VpnwnZoGQeoGnThMoD12ccCxxRUfKt6ou0MsS4cTyQ41GufR3hbU/O?=
 =?iso-8859-1?Q?bk2sMdNr/eymuMqByzT6JEfmSIzYhTOezJMCqgM7Wnys7cTVV1ojEx0DRl?=
 =?iso-8859-1?Q?k7582OR1yoIPePkB737vfIp+IJaZ0/QAsuE4mcZCHBkvE004TtLhOvtXl4?=
 =?iso-8859-1?Q?GHOvXA6pSF1I2ihtKuNtJNHppDXpOo6pW4GSnk/iyJIK2KgQXsizbEveKE?=
 =?iso-8859-1?Q?0NTAjVIEGbrTWZttj3fY8Snjdup3Rsl+3xtgRV/3E4VP31UPz7wKEZBdQ4?=
 =?iso-8859-1?Q?nA2MFB0TU/b/eMZkU/Lg3V9ebfV7sabljVEXQbS9uF8DZVqy2H2BnVmLvS?=
 =?iso-8859-1?Q?9HBwzZMZHxApkIKsDrBTsqtez//Pr5BplrNdN4/76S6Z4cRoyFGUdjivSw?=
 =?iso-8859-1?Q?EJ9WJ7Yh/CehoOqDDq6qJcV/wFtWHo+bT38DJ+L777W1eTDDWVufrGXNdC?=
 =?iso-8859-1?Q?LpxBMh0pd17W2MgubvqNUJ0BI2zgbmwMZDGapoYhq8Ub0LHC8y3JqJoiTm?=
 =?iso-8859-1?Q?8kpsa7rsnRtvRgpX+L/baXYwZioq+Rdm3UtejpYHD/M1OEQgnu8VXpFqUP?=
 =?iso-8859-1?Q?2DYSmM0W3b3Gda48EMc2P05RhW7g0GzCVsLhPJk/fpaVU0/itGrIM+d9Nj?=
 =?iso-8859-1?Q?RyuKHTxVp5Ne8WdI5F3Ebshg7yUIBZjDsAnb3iarKKGgY5U5WFpAoIt8OF?=
 =?iso-8859-1?Q?10h91eWSrNsXWmwHtNsRdpgNNWwrTfQkI0zq76sVTkhu5zW5Js9JMjHkq7?=
 =?iso-8859-1?Q?RargVuM+ny1AZDIrCWFjtAWRoJ2UidrW++mcidHxqdhzLyiRPFfq/PWK05?=
 =?iso-8859-1?Q?vNtQKtlq+yy/PIbe62U453HBreMQV9z6BQiz7cBoRLwzniGELWfMghT6yf?=
 =?iso-8859-1?Q?leFDCMcFHoOlk5XcvrPlZp4kOSKehwUUviMbFL6nr+faFjVTZfrGw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?va0KXKVcIqe5F7IERoCzfYpvPRyCLvE5Hc28lFLA59anXc67fgP2HPY2Ak?=
 =?iso-8859-1?Q?bPo1UufMCZ2zC5DqUZgNVxQLMTXs+x/TiYaFIDdyxK+lX6QfHqSBsi+A2q?=
 =?iso-8859-1?Q?Zgj+nU0g84EBWPMFYAvpmnQy3V6hchbP44DbyJ4/iJrkVdWEPsdePFElOX?=
 =?iso-8859-1?Q?leTCpIh67bOdcQUu0kr8rDZkqbPPTsgB/MWVgszYMHfEjx15jnY9p0KP6d?=
 =?iso-8859-1?Q?nZvGF+DfLfEeZMU2vUuBwMsjuDxzNf2pTgW/Zf9MYZTgtjQ9l4k/v+sh+k?=
 =?iso-8859-1?Q?GI1MuGbw3sU5bYAhxyxHbVCbFISEvNE/z+x+DcSD8QrIFB+9wG7vayUWOC?=
 =?iso-8859-1?Q?gfdRFcoEeUqnR9/cI0HvczY+Y16TIqEaqoK3FTj0kgz0BhOTsaOdN9shX6?=
 =?iso-8859-1?Q?SNhzZpSP03r0hA8QSsTBF84QbJZLcvKbf84SvOZA5zb2YSVC3srU03P2gL?=
 =?iso-8859-1?Q?CFYkoaf9HQXfJSualVOg6yXFeSBIymNGJ3vEl3cW65FQSXxN1A7we014Ax?=
 =?iso-8859-1?Q?AgA0QAunWAZ2QT/jUg4iYk/t4Czdd9mATvhI8q3gV4T08ABFWM2aWTEAyG?=
 =?iso-8859-1?Q?jVJtTE684KQAYRtRgMDvenWZO8KtqmJfRqcWmGNjmMxLt07lkzURhSDUm3?=
 =?iso-8859-1?Q?DxToQW88l/bEXrs63ogzYeQ4SdZMjmYg+nDmmd8UMc5IVtdLHwYzhQa+fG?=
 =?iso-8859-1?Q?RJnrNfMWNQhWt5MlRd+rdP11RCjDEF91AA4UR8sgjO/lYnXTHEGlAmCgDu?=
 =?iso-8859-1?Q?4qigQRGag7yF+uYp1dutMcAipRO/+Gp/4ExqmxmQke3j5v2zUgU9MFoX4O?=
 =?iso-8859-1?Q?G1/vTjw13R6JKNrM/T4unws6Ipj0rMtUgIjxcFYFS5DZuJ5wPpvoedtPRs?=
 =?iso-8859-1?Q?WdYwR4gEsofoLENLdSvxN7IVZ1wmQsep7MwNZsWCKlJKFN8PnTo+PM+Tff?=
 =?iso-8859-1?Q?F2GYIh12o+p/5eBJxJvbap31QMEDsRomWg0JzEnII8cUGcNb46p86Mf2ti?=
 =?iso-8859-1?Q?a84vdf4fzOvm+KcwrYtcLO7jrluG/l/qyuZfHmMVQ3KrGEW7e3fjj0+RJO?=
 =?iso-8859-1?Q?Nbv3TUoT49uGqHD5elGlSNzT1sz5gA1Z8hPrUJkIrHgK3DPi7woIxG1FO+?=
 =?iso-8859-1?Q?KfZd7Sq4sFfUKLOnlZ3v07yxnmm0B0+wI3sksV/VktSRSGw96QlFZy7daQ?=
 =?iso-8859-1?Q?ev1ePsooBJef1r10/TE0szRhKolqJ60USSrElRoGqcfacd+Yp4z8YhS2DP?=
 =?iso-8859-1?Q?ef/QMCFelEuzOV1kia4k0sxo2QjXkS8cvp0G7nVGTuWjZZHIbfRkN5OJWs?=
 =?iso-8859-1?Q?YFEET6do9zEHEJv5LiY3XK/46T7YT9E+PRsoyRCbn/XXqSm4wiGmRVDvHz?=
 =?iso-8859-1?Q?WxMCCnx4UsLI01evmOL9DdhAGmzs1a2wdLffH+apFlPPVmPPU2nVaLKFDC?=
 =?iso-8859-1?Q?3wFwLJEvmg/wRmtPlLwo9KFnAYP/hm/pp1OH6cGklY6C3e1+LXAQTByFF8?=
 =?iso-8859-1?Q?Gko4B/NuFSHf1YySV8vMAG1bPhlRf5oKCbzUMfmP9xdwJFwqiXEQGZWHHB?=
 =?iso-8859-1?Q?omgqvBocdD2JhhwwfQrKW3BHwtiZzgGSfKW69EdwFMVSu7VpBLKK8dBGXx?=
 =?iso-8859-1?Q?wINxSYb4uaw88=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f7840d-ce84-4bd2-7ae7-08dc89f42b77
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 08:54:57.3919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vuNrlUCHnJgQNZRVp9moqbwuP7zbXgPtr+FMgLO5aIegS0Qq0YnLr/NB61Y3Vofr5TVQ/cZtkox/eHt5QmyT0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6099



> From: Viresh Kumar <viresh.kumar@linaro.org>
> Sent: Tuesday, June 11, 2024 2:11 PM

[..]
> > See the spec snippet:
> > " A device MUST NOT send notifications or interact with the queues
> > after indicating completion of the reset by reinitializing device statu=
s to 0,
> until the driver re-initializes the device."
>=20
> I read this a bit differently TBH. It only says that the device shouldn't=
 interact
> with vqs between reset and reinitialize states. It doesn't really talk ab=
out
> virtqueues getting reset with the device.
I don't see a difference between the two.
Do you?

>=20
> > > I looked at: "Basic Facilities of a Virtio Device" -> "Device
> > > Reset", and it doesn't talk about vitqueue being reset with the devic=
e.
> > >
> > It is covered.
>=20
> I am okay to remove it, since you are sure about it :)
>=20
Because of the above spec text. :)

> > > Also there is a separate section about, "Virtqueue Reset" and it
> > > talks about the possibility of a virtqueue getting reset alone.
> > >
> > > Maybe something like ?
> > >
> > > The driver asks the device to reset itself (and its virtqueues) if,
> > > for example, the driver times out waiting for a notification from
> > > the device for a previously queued request.
> >
> > A requirement should be,
> > a transport should provide a mechanism to reset an individual virtqueue=
.
> > (it is not must).
>=20
> Right, I can add another requirement for separate resetting of virtqueues=
.
>
Ok. thanks.
=20
> --
> viresh
