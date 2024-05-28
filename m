Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C8816F825
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 13:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716903994; cv=fail; b=s9Hm/wQxpQef7gk4MbJEQXnRgFPmYm634pEBDsd6oog1kQFC0RY5Rn0gcTXiwH4npJetrN1exsivEVqTPoo0b2ISs3WE8oIte/L3Z36NLVW+sVWoHPi4eTHXZW1OyTTECvUN1qnIQNhnTMhQX0QKaUO+J3G9Pep/zya2yZSFlIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716903994; c=relaxed/simple;
	bh=zY+D+7XZmCM2jMn6nr3FD9ClSldfRMfmuNRvxYTtG5s=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hDqt40onnG4MZrPq9iMMP8E0nQHstTE7FE9wUpUr2KbrTgWH6O8AUR2azgD+rj2PD9ZuKVVfCsVs6SmqV8z7SUJjRshrfTSH9yxx+xMYqSLqAPwINUWF9aNjQvivL0pOehY5+ASE++/GD8iHPIxHLqIlKjt+JYF/ZoDME6ZL0+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Aerj79oX; arc=fail smtp.client-ip=40.107.95.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Aerj79oX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2fiN3ui4kcC4DdLNjIQZkSofZgFBghdsroVZPMlbssRXdMXcqL1wNiFN75FM+3QGGpJRucawAD9tOyAhRLcqJzqeozHfJocG032vu4xTtpax6TYtd+zNyrdTyuPBDgYB0iRqWi6ShhFM1fv8QZA306oL8CvHii1t4E00RgxmE/aAYuRQWk/kgDfzLJIoMFhmO2DlXUe7Rrwkw8QccWq/+wDKwxuOoW9I49PLThIbuZ86qfFlJgrulwDGY3p+YgoLW2aEvGvG8fXTouLpyc7S5cFxbfTgogwAOM63S3K9jMMqftmLp1ZSWeHx0TOxZFwMNsU7UDopyYJ5luBYxAnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2NrFYW7xC3hZ/F47Til+tF11pfy+N2uLE30ozFLpOM=;
 b=GNXsnwofM2dZzQgMZMfZXZY66KKBbto1pdWm0PiMpQ9Tkk8LTE72Z/HKSN8NUhl4GIpTOFV/V3IM4GGGmysFcHA1dfNiMx4PvZ9f2ifzdgGk7VCqarJI24cYgLbXYXojFUdbPfEIwsu/v4lV4k0PqcVsePCDPCDeee/BPa1qe3vE7+HlEHMDcA/cM6dKcRsSwex7JPIAPg30j52q2uEJ2N8UwDs0MiCXLP1tQMd/rz5U1j84mfr14Jk2PHor1jCzx/6hzVAzKBBgr7/yQyTyof35KoH5hig62ZiSCAoLL88tsQWeaPt+4q++ON9fzbw0oIOk3OQ64xghGT9IJOMifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2NrFYW7xC3hZ/F47Til+tF11pfy+N2uLE30ozFLpOM=;
 b=Aerj79oXrbLMpu84YKPlmLFLA68F8m/pEupB+dHTn2+prSPom5YyuXeQ+IRjNf0ibWKzLQEWihs0Ky8FqHLWjiZ/zBfxPfYgvmxXGWg71BO0KCwcAdukRvcQSwQrYYHW4h8dRn+pHQXRMmI+ywn6Y1v2mDfC0R2D3qNIAA/PcUj5Bq9F9Pn8qCM+QZKaZ9sipop2VvqP0Qd8iSlcaxSfvZTUBtnqjH4P6bYIZw9XKuWM3lHOomo6YTzAlf4zgSWvM3s1dIE+xyJaN3xyTuNLle2YMY5bYPbnEPoeAfb99KfuonTM6bsiJdjZdW8cj81tY7Me9FTuE60+aRD5gxd0HA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 13:46:27 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 13:46:27 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment
	<virtio-comment@lists.linux.dev>
Subject: RE: [RFC] Process to request a vote for an issue
Thread-Topic: [RFC] Process to request a vote for an issue
Thread-Index: AQHasP3AyMIVoq14sE6L5ccrkKI487GsmywggAAJDgCAAALKcA==
Date: Tue, 28 May 2024 13:46:27 +0000
Message-ID:
 <PH0PR12MB54813F8865CBD1A8F79EF510DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <87plt6nlq4.fsf@redhat.com>
 <PH0PR12MB5481E79A58E5D2AF6ADEBE72DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87msoanjxx.fsf@redhat.com>
In-Reply-To: <87msoanjxx.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4466:EE_
x-ms-office365-filtering-correlation-id: effda7aa-57b6-4ef8-cc49-08dc7f1c92b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JQL6ik6UVqH1H7cMRm8QA6GC3GPODOMhPVIS9MloUnmIhexwZEGIe9iy9aym?=
 =?us-ascii?Q?8y6NCKozuJrMmWZ/od8zTqpjxZAyQnDW8lOc9Gs6w/pM8pWMrwmTxmGsS/Dq?=
 =?us-ascii?Q?2BKQ+io9+Y7X4TiC/B9zsQCam1o5uA1tFh0DQ1Yqg1G2PamRZUcbVZEIPO4p?=
 =?us-ascii?Q?vVaju5NSKOocl+7tgXYTcR3/yHsbVJovjsaE+n43mPEcMzEx7jei/M9BMd0U?=
 =?us-ascii?Q?KyD/1hmu3vBop0pGZgLxT4CyhVG6fNJswxQma7dUzziPHeCn5ocZz3UAQ4Dv?=
 =?us-ascii?Q?VYOYimbEg39Bo700uDpVba5yWzBYXIWZwmrqLxKtIwNItaPG+7DhuTtN7D75?=
 =?us-ascii?Q?ztF6jFNKFieYQi/wqqgpIWLDdXuIARn4xQ19nErnfm5cLQJq/gtgPsDZ8Vb2?=
 =?us-ascii?Q?GaQQI/6RJmyLMbGScd1LWYaizrhe4iCWpdP9mdwj5MgFdMEvl2/fpZ6LQZR+?=
 =?us-ascii?Q?AQyHGrohVNblGLrO2nTqSG/mbaoeDb65/WNJ+UJbsND4pnslT8lB1DavPGID?=
 =?us-ascii?Q?BKpXNVr5wIUjbYewFujyME1e6sjztXMyn5eXrisA8JSr7MlbG3+JnXqQzJkP?=
 =?us-ascii?Q?koC/Zyh4ccA4qz9GOzmZiARiG/N9C3Th7Zj8J92NmTZPttR6T0S4hL/TmY80?=
 =?us-ascii?Q?ffpwgBwjTWnP6r41TSuPN3MElmFhn2bdS3cazWkL0m7rMwJzGsvfoF+9awfj?=
 =?us-ascii?Q?1OZ041euZuGXgRGfIdyAi1q4ZyMEQQ1QfdT6iiEGYyA1I+8x+eIrHN3m3tDD?=
 =?us-ascii?Q?mipWC3zaeW7+lhAPE+ZcQMRsViHdLEUbSpnp7zdt07KTBTF/YwQFqo3H0yai?=
 =?us-ascii?Q?cqNEQqK7EKfvX6vBjFul9cigMy+CCeMBOR3d9mktniKHJCfMg5x0UM4VpBYQ?=
 =?us-ascii?Q?09a3Vx90UTYSn7jXn8wsXSS2bbZDc0Qos9+pTx2/jqwGZESaDUg9OVrofqjs?=
 =?us-ascii?Q?k7M6EKtwxvrl6ILjbvT7NE+I2Cs6ID2Cg5AMTSVDo0biVmpbxhW+/matCQU+?=
 =?us-ascii?Q?ZNPMUt36eu9iErX9Rn9dRiCpvVNS0vNK9VnwnYSlTHoKpud086GrFw5J+F3h?=
 =?us-ascii?Q?kLCLRoHzI5kKghQcSVdWoiGFLMoqb3AeLrZD0Y/Rjd9LZ/NDMR5QbZcuFic0?=
 =?us-ascii?Q?HRYbcKbhT+4cDqJmnFql1z+MbUrOjRxBs4gmNE0I2QfOM9Z47J65rnH63mlK?=
 =?us-ascii?Q?aWRUGgPDGcDXpyLBWqqbFvRYXZprCS8h3sCtGAjtHJi1CyY5rMEoPkqTPdCB?=
 =?us-ascii?Q?P8Edl41oF4ozKFlqs7Ev7TB6ccSiAf450WoV0LAjb+/XN88FMDfaJFcXyp+h?=
 =?us-ascii?Q?P9cDLwnwlHUm3MIIzcS89+AivULtbZI4WnuXb2pBhzvZkw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aLF6sJkCY7IUoJ6+0HwNvVhGMWr3rKsz+hI+2DQidiHBT2kb5yKjo6KGYwIJ?=
 =?us-ascii?Q?LY67QAXwNvOClywZmP9N315mv+BtODbvvLMDl98DdoV/AZO6eIudiU2T5xIO?=
 =?us-ascii?Q?ovRxNoGUQHvReUmFKvZxJOULsazvQKUICp7SclE1jpT3Ge41HJpA0C+sCj30?=
 =?us-ascii?Q?xDhs/1kuC6JnpYx9NBpGzJqZ6jj/EOAM0q86IqLihUZ8OG47KZS7vw939JVU?=
 =?us-ascii?Q?fGHEDREgM21P6rqMZuLq5XPE8MxN4hg2s2uH1Gb/znbYIEx5VGTr1slP5q6i?=
 =?us-ascii?Q?tYWZU1yBUplhhQ0K+H8+9HQ0Ad9q/rnpb9cRXj3WiDNAF48G79tR45PryghO?=
 =?us-ascii?Q?ljEKI1h9rpv9thkYWhJCWN6EN/RB/ollZFTHAdSmGdYoUtciMbf6qmPElX46?=
 =?us-ascii?Q?OKXXRUtQbpV10P7Lyw8N6y291g24BlAKjYztGbqr01/Qt+HjjBYhxmKBg3l/?=
 =?us-ascii?Q?WosAXfISwH6+gGqQOlTeRpVYdZzdrBwt0fPRB/QnTvJvhsUWqsJQejTo5Uzk?=
 =?us-ascii?Q?ef0SclZPKg+JUys0PLHXldqr9JHM4qi2fH1W886IUP56jHZRlnIR0kXD5+0y?=
 =?us-ascii?Q?pc2HTCElXmFcPYI3AYiETCTMgUVUEJ3ur8kW2JQ+fsbxRvc4hJMuwJUtn0zw?=
 =?us-ascii?Q?cFzyT0Crvfahq+oDG65H+ru69IS/Som71uqRktu72buAvNy1hG5J8lmOtFIF?=
 =?us-ascii?Q?mDaJ3Kyy9hybc3xpEVJvqKMDYU8dbQpkzYRAWbkqZxpSdC3kVW7iSTC2wxsc?=
 =?us-ascii?Q?+q0pUwBzvpj0BtAu9OJHNXWmHyPtZs8oNXLxB3arX9v8QCg2sSR6Iq3dxBTO?=
 =?us-ascii?Q?A5Cct2IF3B+1mOOBQyrEEte7y+Erdnb3nL/SKpUYnGA5fIQ50C/C+K9rAx2j?=
 =?us-ascii?Q?vpiBrp9axtoQzOzC0D2VfLtbXLP64bKoO9qe6BAT71TBXOo4fI8XtsvZD2mP?=
 =?us-ascii?Q?aRwkRjT0CVEk0KJfI821hAzDDlF1bWwAgTcngGI9gJ/z6VnTEpNBm/ZM0KC9?=
 =?us-ascii?Q?p3RlLJLbXxZR6jcJlHMplHGT1v5+hDyWpF3TGoCGw4rjAHdJEtInqHiIlrtH?=
 =?us-ascii?Q?xm270rVXZBe35ErQEngYDxOuHujzBLxln65cTmw8Hz41irkdP34RsZWxsP6n?=
 =?us-ascii?Q?wXi2X36LL2B1+EU7zrU4w24r9QOf07BAYniC41b8lyKWJ3K497osou1h8+QW?=
 =?us-ascii?Q?4f/ljjA8fq3j0//hmzCtbiXoMNRI2rbe7oTriEYKX0+tT0Sy5xIJcN+WyLQ8?=
 =?us-ascii?Q?zCKnsy4Q0To1LeDyUlqg34WXQOHvlk3hprpxzqxmcK59TShR7YcHuBxpKH6k?=
 =?us-ascii?Q?AB2CUoyJiUO42OkG1V0bmSWhzhIDRar8ihS8K8kwUyijwqWybi6VhsdoBK+w?=
 =?us-ascii?Q?9bKe9UgmDXlv0rdyNziQVwEmYKc32cGUBXQCV7D0z5NqnlAHgNzD38rFZe0X?=
 =?us-ascii?Q?N+IR9CxWPt4sOGUWvrXQhA0Ry6qDy4/rkuHIWju1YjNcSN1CVEKsOh0LXSWe?=
 =?us-ascii?Q?VnUFDqt7S+AV/Tt1RRer8rXL3t633uxi7fjXYD0Vq3f1eb7feeggSzNnSuF8?=
 =?us-ascii?Q?G+o/kUGlm7T/5If59LM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effda7aa-57b6-4ef8-cc49-08dc7f1c92b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 13:46:27.7061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6N5WRE4P+FIZFe0AzVJSla/cGh4OZkvDj7owiKoAcZO56Gl0u0w7whZpZ0g6npolv1pmwBzo55IIj3wvfGD2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466


> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Tuesday, May 28, 2024 7:00 PM
>=20
> On Tue, May 28 2024, Parav Pandit <parav@nvidia.com> wrote:
>=20
> >> From: Cornelia Huck <cohuck@redhat.com>
> >> Sent: Tuesday, May 28, 2024 6:21 PM
> >>
> >> [first of all: there are still issues with our usage of the
> >> platform...]
> >>
> >> [Also, first discussing this on virtio-comment, as this is (a) where
> >> people who want to submit changes usually are subscribed, and (b) an
> >> actually working list, unlike the list for the TC...]
> >>
> >> The current process to include an update in the spec is something
> >> like the
> >> following:
> >> - open a github issue
> >> - post a patch on the list, link it from the issue
> >>   - iterate through some review cycles
> >> - ask for a vote, so that the Chairs will open a ballot
> >>
> >> The last step currently mostly happens in the thread for the latest
> >> revision; such an email is easily missed if you're not actively follow=
ing the
> discussion.
> >> IMHO it isn't a very reasonable expectation for the chairs to follow
> >> each and every discussion in detail; at some point, it is much more
> >> reasonable to expect trusted reviewers and SMEs to reach a consensus.
> >>
> >> Therefore, I propose that
> >> - request for votes be posted in a new, separate thread, referring to
> >>   the version proposed for inclusion and
> > This looks good.
> >
> >> ideally containing a note on
> >>   who deems this proposal ready for inclusion,
> > This additional overhead does not seem necessary because when you pull
> the patches using b4 tool.
> > It automatically captures who has reviewed, acked those patches like an=
y
> other email based flow.
>=20
> I disagree: This only captures people giving their R-b or A-b; not e.g. a=
 SME
> saying "the hardware modeling looks good to me". A R-b from a trusted vir=
tio
> reviewer is obviously a good indication that this is fine from a virtio
> perspective, but there's no way for Chairs to know each and every SME and
> judging how valuable the R-b or A-b of a person they do not know is. Just=
 spell
> it out; "SME xyz says it looks good" is a reasonable statement to indicat=
e
> readiness for a vote.
>
You are trying to define two things in this one process.
a. define process
b. defining SMEs

doing #b in this process does not look right to me.
I wouldn't call it SMEs given that what you wrote above that "no way for ch=
airs to know each and every SME"..
It is hard for non_chair to judge a person as SME or not. Seems broken ther=
e.
Rather to keep things neutral and simple, why not just say, reviewed by or =
acked by person xyz?

> >
> >> - and those requests be clearly marked in the subject, for example wit=
h
> >>   a "[Request for vote]" prefix that can be easily filtered for.
> >>
> > This flow described here got to be present on the README.md and if
> possible at [1] too.
> >
> > With reworking the section [2] and [3] to write above text.
>=20
> Well, after we have agreed on something.

