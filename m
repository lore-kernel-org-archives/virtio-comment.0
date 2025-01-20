Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05393FE4
	for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 14:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737382763; cv=fail; b=BPBR9IM50AaeFvO4UwqVBfrzgkhP/HAIUUKroHaNySHTwmpBHjwR65pl5njr907YD0BaSl82mmUPD6GwTnrs4wDJumHs37geVvsuWLHkJIJsEQeP5SplgfYf8mt+T/re3HX7KD49j0VvIxErwj4VnZmfR/zvtC06Ii22wBsvydg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737382763; c=relaxed/simple;
	bh=aRkdgc2FpV1cKSrZ7hcr4AU1OzHAbMYDKHkaxZaNPkY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WE9NRd+ExKotjLYnI/0/yHs758ntz+cGMmlxClqmhJL73MYluLnNt1Avruruo9MRJfIUdNaC+I04vPumuqB66p54uin/ykccYll8FHoffr8uTF2BYL7suQVvL5g0J9TZiSudP/zulVtQHNs8QJz3TT9d2nsE0NreAeAXeNVZtzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qwLRhJnR; arc=fail smtp.client-ip=40.107.244.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qwLRhJnR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zbc6xY71PAEAbGvL23y76EIduTIyAmcdEePheImiWkFrj72flLPhdw0bIoF+obeb0naWcv5OTzLF7Zy5w72GhpadOEIvG2ywxJ1ty3BS6dwdclza/SWL+3jICuprXSAgerkwmAsPyyCexC1giWBjp7dFN7rSvUBaj2jFpNZZfpn90jexsJzpi8Mln45GzCK81I14RILsat/clug87yWc1type/iAOnakMO6oRMTXCEX8AvPabaHRhotg8XzLogF/ME8Roae297qg6v9s6JO9cX7fT+SLjgrp2C1CtPBhsrmwYTmAbXObEBCKYz+SeDK8aSAvAFiEYZuTePzQI8kXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkRfi9e/Ig/LpENFUjD+hJ0Jbw410SS4iWAlKqx1+Do=;
 b=G/AWr50kBi1WjeP1mEfgeCui0f58axSPH1hraCois+mVeeYBnwf51VDseVgZYxFwSOV4JSD1wBZTsF3wTMVzhhWN1FZ0oywAghrQeHaKZZ02FGGHQifdtTk1lk93d+y3/RaFfhCApbZ71khUNNoeE9Ui/9O/lzXcBO2Pzam3HmF9kbQLwyOh/vXmUgoGu1oQVYccTUhex4VA+1ca/KspKU8iMOtlqDH+fvuLY83krx5LzS4J9dC64QBmY3rGxg882kvAli06i5LuNMevenYD23uEP+BPdcgLgJtq0HgPxO+elwW4+E2sH1N43FZ+DvHldjyd32kpGs50nkbKpJRGyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkRfi9e/Ig/LpENFUjD+hJ0Jbw410SS4iWAlKqx1+Do=;
 b=qwLRhJnRFtMrUrVJjMqkTqgk06tJwQdwoaJn3HW4BC/AqoH2RgGDr/n2TE3kwmM61HSxNsH+6mjla+7+los7U6S9EA9OFFHNI3rIkycGL2rFpZcI0aRlyA8zOG9OX8VVWaf8gN0IKjULX4XHj0e8bO/b3OQ2He0uISJaZbiPdmLOanMi3593J+ePZMMs7/m3a0/inw/dHbx13bbMHrNa1k4TbUMUkI37TpIFYI/Nz9FX0s0/fC2yrvdBWLHvGLDy3MvuvqvdNhmZ9z0meM0eOMJjNcljmKDXA50jcw7Xiek3CALDK9RbD2z3otbVAw7qyG4sCjyd+Qb8WdWOEC2jBA==
Received: from PH8PR12MB7208.namprd12.prod.outlook.com (2603:10b6:510:224::7)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Mon, 20 Jan
 2025 14:19:18 +0000
Received: from PH8PR12MB7208.namprd12.prod.outlook.com
 ([fe80::1664:178c:a93e:8c42]) by PH8PR12MB7208.namprd12.prod.outlook.com
 ([fe80::1664:178c:a93e:8c42%4]) with mapi id 15.20.8356.017; Mon, 20 Jan 2025
 14:19:18 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco Chaudron
	<echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, Stefano Garzarella
	<sgarzare@redhat.com>, Willem de Bruijn <willemb@google.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
Thread-Topic: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
Thread-Index: AQHbQK/3KR1RJyc06Uq86qDUg7CIZbMeDhsAgAGk7ACAACgGwIAADtUAgAAhHvA=
Date: Mon, 20 Jan 2025 14:19:18 +0000
Message-ID:
 <PH8PR12MB7208F319B0C0380FAD5DA45DDCE72@PH8PR12MB7208.namprd12.prod.outlook.com>
References: <cover.1732699986.git.pabeni@redhat.com>
 <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
 <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ldv597rl.fsf@redhat.com>
 <CY8PR12MB719550ABC66CDDF8D71E2F7DDCE72@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ikq98yod.fsf@redhat.com>
In-Reply-To: <87ikq98yod.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB7208:EE_|MN0PR12MB6079:EE_
x-ms-office365-filtering-correlation-id: ecb65c37-7fbf-453a-f127-08dd395d6d2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0grtGd/2gAV9CFi6qG7oGRJ4nXAEBjBJjSUa8mYHPXcx0gtWhn0T7vatysUc?=
 =?us-ascii?Q?fKd0T0qrl+tUZbBqMFFcEMWYHOXeUQ5qh0807tLm2Dx3X8GxrXNsHkGOBBl4?=
 =?us-ascii?Q?gWY79TMEUmk2mc6Fjfbra3rSjB02SghyFfnNN5522J9InlaTAjY1xkFckO2L?=
 =?us-ascii?Q?Ohz8OIzjz6S6T8QfJ8duQ04/WuEYiU2YOjEBo4gOukNKb4q1i3Yk/ntYhnWz?=
 =?us-ascii?Q?5mWHgeesNyQ4wl9vor/8TRVRCcbVxish5/pKsPypH0MD6pNgaDDl1Y+emGrZ?=
 =?us-ascii?Q?mginUqRIk0caFLiIpNVs6mvnc65Gdq5IU7zlSbsuyP1n3rkqGT5ahZ7exhdO?=
 =?us-ascii?Q?Nyjr527sve6TcVAH66M3HMSltzY2H8nsHc8xXxlaqJYrSQPRswT9e6l38f9i?=
 =?us-ascii?Q?7cEDhlGaTiH7icyHtl0OWQ1JWpwsCl/XEzB0Xou30PYAfJ3saw7RksjDaCq9?=
 =?us-ascii?Q?ChkH2KxKikKW90JAqHuwJkOxrgufZ5lIYAkVTIOJArdmWDFACFIgwYlFxSsz?=
 =?us-ascii?Q?aXCgBr9wnE6iozMa4/GoKvoXoAvHKGjLcm8WpV8f4e5zGp49A5GddfXAxUUn?=
 =?us-ascii?Q?3RGiqxm7OsdTP8wWJT73CGG4XxY+v1b+V+k6zTMfR7r8xJbdmvabXm1LCgK2?=
 =?us-ascii?Q?XrCSjN+6UycRfeS31mJVhPGJzmDnIcC/tT6mJ5zhTQjKjLqSnRh41iLerErb?=
 =?us-ascii?Q?WW6CCfQIDmmNBJH70KPzQ4kXsGYeN5TLULvZCMrAtc4UHvLtbnk4kS1h4ws7?=
 =?us-ascii?Q?iRmN+no1Bm4tf+LaNm1AnnTm7hv88bySc9V8BezEiKlOX2PmgL9FCx1Hp7fi?=
 =?us-ascii?Q?QIMl5qGZ16sdOFo02X7w2HlgyfWJp9KIw5ixWPOilcMYSJAPR5fHmDEStzoy?=
 =?us-ascii?Q?t+M73yTE6wxx8IGAjOzgXG/08bmiitUIADMxt11DSWU9Xrya6pRUhNFdU3Ay?=
 =?us-ascii?Q?ET70TZdt7EI0uE/ezg2fuWA59egJbIeVJfUpzKtGRwfy8zyMR5UjJwYgAxM/?=
 =?us-ascii?Q?5v0Cu4tpN05xUegBOXnBu5UaNP/4PJcoeN29zatMA1kfOMFwdCKT5ONZBiKo?=
 =?us-ascii?Q?udO61397zvHa8YhhWYlJ+5HmkPHlw1Mss/eTY2MLQ2VAmlJYz8YJ3mHh1Hzz?=
 =?us-ascii?Q?1W/CGcR22e0nFyBLwKToCIiFuQbncL/rv/X3dljeTCqGpy8/JY2WtnDNsx6x?=
 =?us-ascii?Q?4gzfD8Wctwoq9s5MGpkpjPxSN7B0vtCbjj4DF89fZ/gxN/GlvNANiMTvNLv6?=
 =?us-ascii?Q?02wTyATOHfHzjCoMBfiyIaK5hJdDHKvsTQVh7r/NR4umEXJ+251XfoJ+41c4?=
 =?us-ascii?Q?9IxJ21eRBwLZL0wJRvOKItoyidejfQupZm+8So9e5t6JMGmP4oXRB9ol7SmF?=
 =?us-ascii?Q?2lmWdFoNW/3lWP3pNTdc/QjVj2wr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7208.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iMVsl2QzeQeT9vInAIP1rB8QZy+kom/3y3ozLLG/UWe6sA0PZt6mkcroI1gM?=
 =?us-ascii?Q?8RiGNmuRC235FkddJOScPQb+BCOco4PYBlXRxvk1tJKadfR9vMI3GMPCkbm7?=
 =?us-ascii?Q?h28VYagLgBZhwiZVmRyDYVDqQjrdtP0afuSeo63OXkqd9x7VQ0/r5jcsCUPe?=
 =?us-ascii?Q?q8sO1bqP+PV3sTOiVnhGUul0pNHecGTFLEp5BnWN9hMPFSjTJX02KU3klgJg?=
 =?us-ascii?Q?hPbZ5JVCqtcY1VS2Yuw+QqsDKqFYpOXnudQfCsqiNZyroWT4RflMAf4D5yny?=
 =?us-ascii?Q?zCUe2WG0mmxW6rHlpOLT7OzH4evUPCei3ehf9D72so13f3i9L02drjMVRfdN?=
 =?us-ascii?Q?XYnsZPwgSjB7f9fF0WMGmYnMIqyYXxNJDFuhT9PAOWcOgZE2c4FLIRdKtNS7?=
 =?us-ascii?Q?ElrE/qITqKp9yY2q8bbgVk3vZnIspnvU1Xl+JmEt6e7smhDNGTraaL01nB+J?=
 =?us-ascii?Q?0VVCegbEVVNHJlyvC63aGOcOAV84GmqmErJ9tm2zocuFoCS2J7CMLq3uuiXm?=
 =?us-ascii?Q?9BU4TX+o3MndDRjK5j+dhYLzNgU6dZQTqsTRomXESZ10WpdanlLtdEHF/Rfp?=
 =?us-ascii?Q?MReMYja2rdRMtA3ay5q3s4RnY5fK1a3+84Xq0Kbj2QmzaVefhKl/A3Jjg6WN?=
 =?us-ascii?Q?QvYyECl50J0vEt69ErVnBMmfFYJd8q+xFDRMqWkERg39tMGjsM8nZI3qgyfM?=
 =?us-ascii?Q?EHU9ymNLn+k2nZlgxFO3RxFPl54YUAYb2GxJT8vug7DunsZpewyYTE/he34i?=
 =?us-ascii?Q?kPynK5tnjaoCXXjj9DXthOdbbXYvU+XdcYvBqUSETFM8y1+m9zAQiQaxrXnq?=
 =?us-ascii?Q?K3kvtjkRVm6shx/jNG6xzdVOG9YIljp5A8RmlH31yRUM1Noc+JecEFanvRUW?=
 =?us-ascii?Q?9R7IND4ZM/9jbuG/18HdjiubDWH5je3z+PZpeUAjvzt8KteTFJYEuAGDo0CU?=
 =?us-ascii?Q?67EQIZ3FqSIx0SK0y062+hei5wWndtqlYX2O4KnWX6IHXqZ2fJ00zpIs7CZN?=
 =?us-ascii?Q?rZY5pMssXQzihQm25M90+cdFbe0aqSWR2jemXwr7OsQRlCkF2zyG8DARr4LJ?=
 =?us-ascii?Q?UYuwCsMEIWCedN6rfZ5GUNdhTQN/0k9K5BwGPdDhLuusNaTJdf936S/HIBrT?=
 =?us-ascii?Q?BmFI1JBxguhsYuAveI0Px7tDSEuSmwx1H3eoyzMSfFRc7rDrsqHUhMwi5tJF?=
 =?us-ascii?Q?l8Q1EllPWOMTXXhBXadvDczIhpoFvYR4wjeddrU5kcY8+izuzg11z0xuQrPd?=
 =?us-ascii?Q?AzLSQBoYfYYWlN9VXguEsr1h7utMypHQcgTW+1IUKEXa3E1fs1lCBUctJ4bo?=
 =?us-ascii?Q?n3JVDdSMAa274+UoGdeDSd2tZ/wpl4a/cAmCL2i9i239m+q/PRg3Q7Yc3E3L?=
 =?us-ascii?Q?BfUYVFWfOgxpbc2YP7zVchJNYTz+ci0UnbsJRqqXqi+P3dWFsfjauASDkGLk?=
 =?us-ascii?Q?6NiQzc58ZUcKb/vHiVFiZqPpd2qmJX+5LWpw6AoTiC0OUs/8NqinwDIVNPQo?=
 =?us-ascii?Q?Zk4usQkLG4F/xm8YvrPeTv7lJ41gJh2+Ogo3eX/0kXqvp/rcacH75imJcH/5?=
 =?us-ascii?Q?xFKkjrc1nzFTAC7yznY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7208.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb65c37-7fbf-453a-f127-08dd395d6d2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 14:19:18.2539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +dL+vV7hj8/bQ5EhZiOkjpCxT+O2gZ45xWD8NG1Gbm1F8xxNf5/chb7o/NXhQU4l0EIdpwqbZ+NiefYHpyrdYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079


> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Monday, January 20, 2025 5:50 PM
>=20
> On Mon, Jan 20 2025, Parav Pandit <parav@nvidia.com> wrote:
>=20
> >> From: Cornelia Huck <cohuck@redhat.com>
> >> Sent: Monday, January 20, 2025 2:34 PM
> >>
> >> On Sun, Jan 19 2025, Parav Pandit <parav@nvidia.com> wrote:
> >>
> >> > Hi Paolo, Michael,
> >> >
> >> >> From: Paolo Abeni <pabeni@redhat.com>
> >> >> Sent: Wednesday, November 27, 2024 3:07 PM
> >> >>
> >> >>
> >> >> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can
> receive
> >> >> GSO
> >> >> +packets
> >> >> +  carried by a UDP tunnel.
> >> >> +
> >> >> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can
> receive
> >> >> GSO
> >> >> +packets
> >> >> +  carried by a UDP tunnel.
> >> >
> >> > Feature bits 42 to 49 are not applicable to device specific type.
> >> > They are
> >> reserved.
> >> > Please see the note.
> >> >
> >> > Current spec description is:
> >> >
> >> > 0 to 23, and 50 to 127 Feature bits for the specific device type
> >> > 24 to 41 Feature bits reserved for extensions to the queue and
> >> > feature negotiation mechanisms, see 6
> >> > 42 to 49, and 128 and above Feature bits reserved for future extensi=
ons.
> >> >
> >> > So 2 bits of these patch and of patch 4, 46 to 49 to be shifted to
> >> > bits 65 to
> >> 68.
> >> >
> >> > Or an alternative would be to amend,
> >> >
> >> > Bits 46 to 127 for specific device type, And 42 to 45 and 128
> >> > reserved for future extensions.
> >> >
> >> > Michael,
> >> > Please let me know so that I can have the follow up patch to this
> >> > one as
> >> voting is started.
> >> > And the fix is required for it.
> >> >
> >> > Is there any historic reason for 42-49 as reserved, or it can be
> >> > used as
> >> proposed in this patch?
> >> > If it was only kept as elastic buffer for device generic, and
> >> > device type to
> >> grow it is probably ok.
> >> > Using 46 to 49 has small advantage to reuse in the offloads bit as b=
elow.
> >> > Please confirm.
> >>
> >> See the reasoning given in 88895f56e642 ("Reserve more feature bits
> >> for device type usage") -- the idea was to push out the point in time
> >> when generic feature bits will have to be in the bit area beyond 63.
> >> Given that we only used one of those generic bits in the meantime, I
> >> assume it will still be some time before we run out of bits, even if
> >> we let the net driver grab some bits there. Still, I'd probably prefer=
 that the
> net device used different bits.
> >> [And issues like this are easy to miss during review unfortunately.]
> >>
> > I made assumption that one would have picked the device specific rage.
> > I missed to detect this early enough, my bad. :(
> >
> > Given that we are only left with 4 bits in range 42 to 45, at generic l=
evel, it
> seems wise for device-type to consume feature bits in its defined range.
> > For virtio-net, bits 65 and higher are preferred.
> >
> >> However, if the device was to use different bits, the clean solution
> >> would be to withdraw, respin, and revote. If we only changed the
> >> reserved ranges, we'd be fine with a change on top, so that would be
> >> less hassle in the short team. If we decide that we can live with the
> >> smaller feature bit space below 63, I'd be fine with that solution.
> >>
> >
> > I am fine either way to merge this and fix immediately for using bits 6=
5 and
> higher.
> > My preference is to use bits 65 and higher.
> >
> > Or as you suggested to respin and revote right away to forward with bit=
 65.
> >
> > Please let me know.
>=20
> Personally, I'd prefer to handle this in an "atomic" manner, i.e. making =
sure
> that no version ever has the wrong bit numbers... maybe if you did a fixu=
p
> patch that changes the numbers, and commit these patches + the fixup all =
at
> once? Less churn than doing the respin and revote dance.
>=20
Here it is.
https://lore.kernel.org/virtio-comment/20250120141052.877355-1-parav@nvidia=
.com/T/#u

Do we need to open a new voting request for it? yes?

> >
> >> >
> >> >
> >> >> @@ -1862,6 +2068,7 @@ \subsubsection{Control
> >> >> Virtqueue}\label{sec:Device Types / Network Device / Devi
> >> >>  #define VIRTIO_NET_F_GUEST_TSO6       8
> >> >>  #define VIRTIO_NET_F_GUEST_ECN        9
> >> >>  #define VIRTIO_NET_F_GUEST_UFO        10
> >> >> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
> >> >>  #define VIRTIO_NET_F_GUEST_USO4       54
> >> >>  #define VIRTIO_NET_F_GUEST_USO6       55

