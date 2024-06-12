Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8D029413
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 07:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718177590; cv=fail; b=KJa/mbb1jnbV4/4WWVDv2UUucnZABm2+gZt7WO/vh4XjDEI0h3qlmuCA3MdP9jLtNVjfYPtGneS1hYJJW9kBtajxQ5hmp87f4B2WvSIxRyPmH4x2Jr5WZlw18ubetC88a6eRLvQBrHwlCN74SaLygQmdJ4c5HPCUDQ993QR2zb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718177590; c=relaxed/simple;
	bh=+WUsG9N464rUhyFl4wwLlCEuWfbj0LwskCRvkZ7hr7E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sBKn5KOB/2ooF+cehqiJYWtOwof55qVRBoipr8a8tN83S5brBzfOg8CCZJRUPZs9HeL6GE/fSqiNgCUueJCuOa57U8hT99TlEa+IWTWH/GBzZb7reWkw/Hm3B0D7ZM0yAvoRRlRPt4F0DFzh5GbPeXLBxIuGbAkY4mEWLS8NHaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=td7aw8sp; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="td7aw8sp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dn/nJooTWSRFl+bg/onS3VF3J5TTpu4TsTKm+jXpu/ufqQ8e7YdbMWXoss+ke1S3HaTM1gT4yc3W8RVlXWk/j9F5rMVVWgi5jWHPaukYUOAFKpI8D71kI+1KMA3+gItZHcep90P+w38s6GzfXbrTR5OshzbcbH5hYXH1MAOITCCS0G4c1J/Okqxga6At2Grrig+tfaUePrrL4kPvcxcK3DQEHN01xTn2I6mdo65eQrv5Rz8bAEcZOn/I0IprKEJahIJXOOW3RhtAtEzWjPBG0SrDddsLHjTgdNDaWyRigDkCPV9WO80vYN3mcis3yVHfP95CGbtrb1M3H38uNdvoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdKwlBw4BAUxr9aZkRVSlQy4fgDYg7+Ow0MdXfuzA/U=;
 b=D+UKxCjmxOXPAn9WwJBolU4ijTRzixQRE0xRMD2De7l6qH7GrrTu5kOZGpYQmPhzTGrzF7i6/BkwxftMub1pMNBMhN/jGER2qIGplQvsJniMLZ3UzMkjqDslxibYZLBPHahiutzvpTcsOOlS+JsOSiyS32LmO7TsDrDABNtCT9FiYs0vY+v3EoEhnFAr0/ibka94NWBzRg3Z3a/VH/BqIHg0vd1ddBqa1/ZCAFHKlFf+3+c4lhFc093CEK9PkQ16PwWl6388u9bUQ58/hllXTipR5h8bB+IAxr5NGJkYwkHVat19FWNgOZfxFFL4NO2wDMNXhPTNqzYsmCJUxCukZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdKwlBw4BAUxr9aZkRVSlQy4fgDYg7+Ow0MdXfuzA/U=;
 b=td7aw8spq9+5B/QXPBmxGp/67Si3YENrlLKHypxPsptoO+V8os2YLNLUUiLstuiYLvDct5eOkzpOj0Slwr5S7P7tqxcYtrTN+m4LpChfZxVWDZEBPUnzfb+DV7lRk/yF/oOsADl80/M2toOLXoEmCbedrXgGF0MBAbippJ0WnoSMPp5VriKrrOwuvEU4Pm6Q44pBnW48aRjkdFF8XqPTPmhqLohCePSqqh5sGfiUA4jSlOCCJ+sfw9+IxC1kQHod4F+nT0LphLuuy6rci4efmc0OVdYzfom88x+AsmOPhsOTewe/fhMA4V/FPlFmQH95Bj0q+SBpGD5ZyEOMsxIWCA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by PH8PR12MB6987.namprd12.prod.outlook.com (2603:10b6:510:1be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 07:33:05 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 07:33:05 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Subject: RE: [PATCH] content: Add link for the feature bits chapter
Thread-Topic: [PATCH] content: Add link for the feature bits chapter
Thread-Index: AQHavCjmCNHfYxCVDUSynMuracSoELHDMSyAgABLXfCAACFRAIAAHQGQ
Date: Wed, 12 Jun 2024 07:33:05 +0000
Message-ID:
 <PH0PR12MB5481CB9537EC4CB2C0FE06F8DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240611175721.2550759-1-parav@nvidia.com>
 <20240611190949-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813E40929A98725186EFA0DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240612013634-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240612013634-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH8PR12MB6987:EE_
x-ms-office365-filtering-correlation-id: dc80eeef-c884-41a2-2037-08dc8ab1e626
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dkU5P6yYx5ctVWingHwD4nqjQJz3ZVq+J5Yquvan8lCWiFihiwTXdSt1meXk?=
 =?us-ascii?Q?0pITm6X+PRDX41Oq7B/f8sUfNGNIXDPPCSGl39Ri9Zfovk1CtWsDg1VeVCxa?=
 =?us-ascii?Q?3owPkQWAyACpQ64XBzOZyFErm3ByDm9WdudnV6d6E/5UHT31EmKc95Ffoj71?=
 =?us-ascii?Q?gjGx6whT9dzpFJkO7HAwovo0Q9vDHb6FegZkqiJOge9GAyPHzDsPQ3wwi3Zn?=
 =?us-ascii?Q?j/fFd+3XG7BwTb+8tTjN/ZHlfxwrIi4EESLg5pJ5Gu9apDZyMAHy8jhPEewn?=
 =?us-ascii?Q?RZji/K87EwVnv3X01f+EDTNPqUDYr6cnWQFuzzSx4QMlwUBlBLhpD1l73qVs?=
 =?us-ascii?Q?+6l66RaBZzuXl2v6T8Q2x5R2deWq3Llfr72MjSjCm0yJE6/JHz8xhEAcXZre?=
 =?us-ascii?Q?L/Al6MRZn0Q9uXgjOCGezh2o0BP/VGCt0m2geBxDuxhW1NBceVCEHrDKyD6J?=
 =?us-ascii?Q?QUPG1v1Owxa1ObXM65QfFN//vpE+nqpYf1OW2kN88b937yUWcTZ+5btHQmw2?=
 =?us-ascii?Q?P3mL43ixQyVhowcCOQyw0H7ViQs7kaOJLQKvdpt/ZnTkpUJxnsrcbIG9Lt8Q?=
 =?us-ascii?Q?Cx5AvoRf3241SIA2yON7qSRJSnp5IJwuBeEPs/drsUx3n2KWuDD+TlrNGgCN?=
 =?us-ascii?Q?cZfvctzamVySmwZARtYQxFjRrvZlPlJNChGeu4roF/CMR5/aRzIbd3MY0RUe?=
 =?us-ascii?Q?wRGflixUqeJ3wzOqUYXxIYFa8C+86tCsxt/fw9DTuuxeTSf8JKwswvisg6hs?=
 =?us-ascii?Q?0h9Ux1CqGONqp28j8Jvwv+zeqummOgkgTddy0wVpC2PGLpxddGonoGRHxRC6?=
 =?us-ascii?Q?BIR716i4wBXthVNGujybpgqUGxtyTJRIeU6mbY+N+CIaaZBZikiKggUYBbwD?=
 =?us-ascii?Q?wHISM9KdElFScC6mfZ2ZH+RtGP6J1DatM9/KkHNPQ2lO4AifuT90cnrbpGzF?=
 =?us-ascii?Q?XRH42mqW8GSPxTXzQhbhnL6pOGPnEvqpW5N2cu9dh9lBTfuPZm5uDZaRwFYL?=
 =?us-ascii?Q?udNM8zoks/zqaY+d8g7uWcKJZjPU+N+TjjfTjlBJ8whK2v49O4CTd3aFG6Zk?=
 =?us-ascii?Q?VNzEpifKv6uaExqfcQxtpxiCi4LbgD2Dqi86DWRbh9tWGrJ91HGUKDe/FssI?=
 =?us-ascii?Q?znQ/4r8oZQcK1UlJfzEQH8liQ6t45puo/mBdhGmePmxDyhzDre4PHf+ZCx6m?=
 =?us-ascii?Q?dbuMWIt894SxCneoxIvVb6aUk56FMUbQL+Y9/vu6ZpblvTqfOLUtbaPiB5TI?=
 =?us-ascii?Q?yZ80KSSWH0ddIOJr2nqKGb0s2oWY0mKOD9uAA2WmS993YHkF6FVFrPeVwBK3?=
 =?us-ascii?Q?9NQSMtOigqZU0VSYsKGjykGCFWVLF7STqoOjO3Yny6gThHrCP58OWG9/LTYD?=
 =?us-ascii?Q?cYJWsuY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?U+G3jFa4WzqvfOCjrJBpqIbYjpENRqcwIUVrSudTj1ifOcC1GadzW/d2oLPt?=
 =?us-ascii?Q?7A3Tv0/e27IHI4SmoM1SDCVZ1NwnYz2EU3IR2XnyRFY8Q8h+X9rfBkwTg4fD?=
 =?us-ascii?Q?2IvZrQOvIXcck0tX3I3tlzFmDjjXQOqqW4i7jdu/2HWKBW6bcbIlhEb8/8Yx?=
 =?us-ascii?Q?J7eUCzHGAOvigjVBXZnSuwRNK5CcyOE7d7MYScQYN5aUZfk59/4w6yw8VF0X?=
 =?us-ascii?Q?AUR4PnF8aniOSlJHjCu7sya2J9kJvJu2uj9++pL7vvITu2+zkPn5aliaoaSp?=
 =?us-ascii?Q?wJ8kaTmA4OImFPkYfs/PQXPwXoLpqfQLFQoTxNZrWqHs0zTvkZ7HzgCRq7oH?=
 =?us-ascii?Q?kZISmxYkRjad85cZsgSl0iO9qV/4aSnYI/6mch2aE/dOaINBHLNoYayLihXI?=
 =?us-ascii?Q?tqD7Virgdi1jEUydv0K8Fxc2NslzU8l3UJsSeRW9saOzcHDtBEr76uoQXMBr?=
 =?us-ascii?Q?WxhO6I6Bg9NS/yDMGw1Kolt2klP0ngWO5baaqR1nG1npeb+df/GRwSO/j+uo?=
 =?us-ascii?Q?lsmAq+H+zypSterhQdUknzVH3HM1JIYJyGhmUNzUad3/TANyqA8GWqcBhNl9?=
 =?us-ascii?Q?Z6YZqAuFWtruf6PUrXkdD+bvenN6GmjqL2Ja8mqYTPEqoU/LmdpfC552GUn8?=
 =?us-ascii?Q?6CV5R96CGmizJrZ7fTEvlBcxzfpN/6SCW1e1Zu3130/AuOmnwYfddvOoiRx3?=
 =?us-ascii?Q?EF/bhTqm1IWqTnJnxARHNjNac0kykEJFN+4AHvu8jv68num/k0JISHprBlpd?=
 =?us-ascii?Q?6gaYkgdFHj2NturtGlYUSrTn3RZ+ziUI0Kl6DOjnPh6xWdpqj8fnPc7JRt4p?=
 =?us-ascii?Q?sMLJdd+Cp0oUMX5A69F7ivIQUpyGNJKT9CVtS5Rcwqp5op0jQCckX2v/ad8K?=
 =?us-ascii?Q?C0xfjXZHrDmoTWi2a+aXNmqjtrEY0X8Hl1XnnslU6VguM7TnZdue8vrk08Ym?=
 =?us-ascii?Q?4IFCuS/ssnxuNkaOfPuo9VQ7xVl2BYLLD0J6UmK9aaDRjPqQ1TsP1GH7Qdjv?=
 =?us-ascii?Q?HrcfxLgVBpRLgMgaHMsAVPcvbHLgvONwxtpPhMi1oTkaWsk1nCy1Ut4QdUuf?=
 =?us-ascii?Q?Q1PKHnxc2cWIPYWlRveTwm7WqXHTUjpTbV7VMSkI8Wc9aFN+rgvu95Wdmo5L?=
 =?us-ascii?Q?wXo6zpxYfEsRO1BLBQWTJ4kMt3mB3jfeOOwRNLb1VOuloh55nJOoBqjmk9RX?=
 =?us-ascii?Q?hByGnxKAUZoDPrPUf7/aIADKB+vEFeMCWyONsxxJhpORqZD6QbW6YYXS/DJ6?=
 =?us-ascii?Q?UeSIW7G5T211zjAe29sZDGlSvcrAB0O6NQftFyTm+DmxFCwfH1+jjKnU6aHn?=
 =?us-ascii?Q?9fM/YlbCn/Qu4KuDQBwaHhuAvpFXE3n9lSrNadPjf4zrD2YMmdscP+QA42m0?=
 =?us-ascii?Q?arrngLLWsL9mYamqk/Z5TtMA6l3+2j7prOUvnrdzT5lBG+0+EuuMLYmuCGfe?=
 =?us-ascii?Q?yYu3CBedTYFRJ9YiG1RtQ3nqoNs6p95PxmUsPO1TsIuh9ZFlvVBBZ+S+JvyM?=
 =?us-ascii?Q?B5cCYZnMCVRgbkb7csZ5ApQ5fikUd0j3iX5gxWlqsww1eXACkf9qqTKbXZEF?=
 =?us-ascii?Q?+7uI882zWmeTzf6qX3Q=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dc80eeef-c884-41a2-2037-08dc8ab1e626
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 07:33:05.4645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J6nymXJSLM8G4/DAV13ZPtS9YqYQOLDBu8ubjyP1JznUx6oeTLIi/y+yqFKUkoaWamYqVGvfihXwxKbFGoUm/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6987



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, June 12, 2024 11:11 AM
>=20
> On Wed, Jun 12, 2024 at 03:51:48AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, June 12, 2024 4:42 AM
> > >
> > > On Tue, Jun 11, 2024 at 08:57:21PM +0300, Parav Pandit wrote:
> > > > Device common feature bits overview in the basic facilities and
> > > > their actual description are apart by 24 chapters.
> > > >
> > > > Help reader to directly reach out to feature bits definitions from
> > > > the basic chapter.
> > > >
> > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > ---
> > > >  content.tex | 10 ++++------
> > > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/content.tex b/content.tex index 8849522..c3531e2
> > > > 100644
> > > > --- a/content.tex
> > > > +++ b/content.tex
> > > > @@ -97,12 +97,10 @@ \section{Feature Bits}\label{sec:Basic
> > > > Facilities of a Virtio Device / Feature B  Feature bits are allocat=
ed as
> follows:
> > > >
> > > >  \begin{description}
> > > > -\item[0 to 23, and 50 to 127] Feature bits for the specific
> > > > device type
> > > > -
> > > > -\item[24 to 41] Feature bits reserved for extensions to the queue
> > > > and
> > > > -  feature negotiation mechanisms
> > > > -
> > > > -\item[42 to 49, and 128 and above] Feature bits reserved for
> > > > future
> > > extensions.
> > > > +\item\textbf{0 to 23, and 50 to 127} Feature bits for the
> > > > +specific device type \item\textbf{\hyperref[sec:Reserved Feature
> > > > +Bits]{24 to 41}} Feature bits reserved for extensions to the
> > > > +queue and feature negotiation mechanisms
> > > > +\item\textbf{42 to 49, and 128 and above} Feature bits reserved
> > > > +for future
> > > extensions.
> > > >  \end{description}
> > >
> > > Not everyone is browsing online, printing and reading should also wor=
k.
> > > So no need to be cute, just add (see \ref[sec:Reserved Feature
> > > Bits]) or some such at the end of the sentence.
> > Does hyperref break the printing and reading?
> > This didn't add any extra text for reference and reading in PDF was fin=
e like
> before.
>=20
> It does not break it but it is not visible there - you are either saying =
the link is
> helpful - then it's helpful for everyone, or it's not needed then we don'=
t need
> this change.
>
I don't see how 'printing and reading' is linked to 'everyone' here.
Anyways, I used the \ref as it is useful for navigation.
