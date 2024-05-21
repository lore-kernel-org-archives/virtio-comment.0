Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D499E770E7
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 13:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716297871; cv=fail; b=oTWFNC1dEZ5QXpKK1Huexw1XjboK7z2ApAZaAyQty3+g5tZJ+ubuLHEpEg3eIn9KxHfQm4waAVUvY9alNdFjcF5YWqPT983W11ftmLqvqXtcTMQ38AVebQF5FrFdeERLndYHDlJE5rkv/IDFDi1XR8+6oeP3mUUaCw75xn4g8Ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716297871; c=relaxed/simple;
	bh=9e4wg5zprf84ihvODkp8htt78QVhwoy6dy8iiJc2vQg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gH9aYkAgcX0YD4SKK3/H037c0X/Ofh7nY9GMwuSHyvblO1S6OZOtvkELBfbvJyldOzUY3rrGYhnUZ973gXB+D849mdb3Ecc6xlKWUxZpZe5mNj8rpyi7N1uNXgTwb/b0zNT/47RmctCNRsTpEtieiYvjTjD4+4ojtmbqib5gzpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cQwuNAc4; arc=fail smtp.client-ip=40.107.236.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cQwuNAc4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRJ0Yn2ygxQH+vg3P30IJy9oLb+h4M5oaLDLe0oIgTqg/iuaN4Z4pgywANYw5QLEh+0BKLvXdftqc/38BdmtSQXXv6vB19qL143jfpCB7rfOvAb+1cdQ9zwKFLTZuxKQ7MitEfnP71mZYVVCOkavIOfACB0z5DeSv0r5rKMXriX3TeGn6X6NwEi7RkiO9cx5X63UNS74SzV5eTfS4ik4fvTKrfWkFneLI6K3y706UoJTke6JQHcpkte8SdeDauhrkDAM3aLSN0Fr2q7QuS48/B8+qdoHchTmchUiM5r9tytCZnxIIA+ZRn57FsoM6JuCbmYGhPAQRLNMblbkPKA/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bCHdW04od11rW0uly0fHOjgmDQhy/X2KHKarTL7W+0=;
 b=oeObXyWa4ac6eM0iLMDrO2MESnJZVx0ZO1JGr6ZimuXIOU2wqL3Mh2GkvpBrya2TwXP7xMaQALeD9BY8pP8bXd17mMwr03ydnDFip42bVw472mzWN8WX5lhExtZinNab/hXgFBmER5eKC8pZfogMDPqVT6dzhBdfmGPc+HzazQFIr/nmdNnEDr2n1+Ml3Lv62f+p1rV/1GbQ+WdtiLV5nAHIWKU+uz3Z+OWsdDdJmCU5v6uXEtpv4gNkdo6mKpjJJbLblcSRbA8Xa9sOYu1JiOPQ0QBP9rXDkj8chBIck0rQlByHJTZylU8pxFhouxcRPFDm6lmww5uQbgetIHazJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bCHdW04od11rW0uly0fHOjgmDQhy/X2KHKarTL7W+0=;
 b=cQwuNAc438W0+UH9CGkd+6Dmr76tLJjfZ9RDhoVlQD6h68ml0lWOiqeFW62IFNwcdkyFKAbPU6rIyUKxAsoUMIH6F1C2b4lJhUWN2FW25ReUKxYinmSHiQvhA7A9TM8xDw3kGa/CPbV5Lt5xdi7be8XGrIXKw+JN1fhCVCjOhyqWWjD95w7Qby4bvVfGONjFob4mjOyZh/Y9jtTxTvicupMa3BqV+NR6NXcj1TDxT3TrE8SZQyZfbvn8iAbPNj1N66LZZCSVadV6hLhaKhJeWw/g4pBfXn5rXi/cpG4nEBQcp1eU4WyHsZ/a34uyESH6rFBKGzSLUslDVtfvM14eiA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DM4PR12MB6398.namprd12.prod.outlook.com (2603:10b6:8:b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Tue, 21 May
 2024 13:24:25 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 13:24:25 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v3] README.md: update mailing list info
Thread-Topic: [PATCH v3] README.md: update mailing list info
Thread-Index:
 AQHapq3cqOwFBT2zLkCXuuWIgQjcxrGYE1qAgAAFLACAAABCoIAAAYUAgAkETgCAADPxgIAACJQQgAAibQCAABuRsIAAEj8AgAAAUxA=
Date: Tue, 21 May 2024 13:24:25 +0000
Message-ID:
 <PH0PR12MB548123CFB2F493A79CE15271DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
 <PH0PR12MB54818B506EFE9E4ED61B4294DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515062910-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515063503-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A1F599028CBFAB58F594DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240521032438-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481168F6B161E51F8251992DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <874jar8p0v.fsf@redhat.com>
 <PH0PR12MB5481394675923A8A4EE3166DDCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87y18372v5.fsf@redhat.com>
In-Reply-To: <87y18372v5.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB6398:EE_
x-ms-office365-filtering-correlation-id: ac198c55-f070-401f-c52a-08dc799955cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mW63FfWzoNqRtnbQb9berOtQswuOVptNJ8DsH0Ek5DEgeOcfWM1zr8j/v63N?=
 =?us-ascii?Q?oEqdoUCGrfAIBpUxUYxxZvKtdcw2Ryoa9bK8kkZQ/fSnAVwIhWB3EfNXEeYC?=
 =?us-ascii?Q?5uJ1GvHjU8uEDg/ORAa8gvC84zAECM5KNLKusH4vNQ6AXvCknHblUqhNHu8c?=
 =?us-ascii?Q?cblfv/2T5HOL8hbtThcziPTR8lK4EiC5r50nfMyCNSHhf1RhnR116gKYnIk5?=
 =?us-ascii?Q?iQMBxxj2GezkYkIXBoO/xGJZTYDwCuPKaJEQuuoS1YXorP77jFMrb0ck5fY8?=
 =?us-ascii?Q?yQWtmvSZ/nvwP0G9qNnFuTwCGWDKGjfdyChnZPcC/6YQfQBa3XO+Z32iQzTA?=
 =?us-ascii?Q?xo5sDjH5r5MdDv+kIfQAWppl+d1TwGYpBQl7yL+b7WYUzheSD366HzIAuUse?=
 =?us-ascii?Q?q/GNhLC8O7nHvsB2p9SAvghUppyJrCotOWZF8FSMC2pX82MR2CBnJoV+eeTU?=
 =?us-ascii?Q?B6HMb21kZOzP8EIDWr3TK8NlfZgiLWqc501Pojxv6hqEUTbgxkWxgyrH7oPn?=
 =?us-ascii?Q?ND91xcH8wJ4yVWytdgy1dCxUPM6etAu5q+MhcI6pAOkkOfHF9X1jSMDQdxRU?=
 =?us-ascii?Q?FwNaI7AmkJETec/gMa18n2C+02ZnHQ93Ocg4KMOxUi51sPvB+EpT6wVEtVc7?=
 =?us-ascii?Q?hOFllw1cdX5h3rOax3VHXAgwSK7NmuFXoqxSudROhvophkeuFRzYYMOJnXdi?=
 =?us-ascii?Q?bDUe+F2WvHzOXT6zhbjSxleJpsfDV/fCkLDbhBfGGzJ8r9og9Dm79wLjZYNQ?=
 =?us-ascii?Q?IpSbNjrPIYTGSNZlq0noiklFyPtk0FYZuP3mgi6zYT1IEs3eRE7VZaPx07vd?=
 =?us-ascii?Q?2xQfPZC5mfct0eTIGdA4HZXr8hrhjSbb7CNBn0jXweeyU5vt1sD1MVh5aQDK?=
 =?us-ascii?Q?aXQGiUGCBoY3cGYhuKUKXPcT4dcsv08MMtPj9mwGADiLVZgz5VdVae7DQzy6?=
 =?us-ascii?Q?q96Ih98jC0kl6br1DriRVMuZqnSQc2mE4cq7314GuxdySzrc3HbaHpAZuSAb?=
 =?us-ascii?Q?wW4B63pNHhtlBHNAolALS+NQjYhetHwpwm5c0SUJoWevoNEGwcl1bUO5SaTA?=
 =?us-ascii?Q?YA5WYa7sUsrQz6/r7KkWo12ZA3+Sx+54hQrmjs3XfPuh24d7uyUkFFA+R5UQ?=
 =?us-ascii?Q?lNpybToLYmQAgJTd4C/tkYL34xX1KSh9YZtqo9cQfhGkBu+wLV/l9KDMWfIh?=
 =?us-ascii?Q?YYz7PhKpYGECmRpoeiR4K34ds/J03hY8EPAvOnN8vKj/6zpDXb1QRKyCWxBC?=
 =?us-ascii?Q?Njv80pZ1TNhyMBx0itRPcq98FIRX0t4VSayoLGQyHw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oFCcxL7f/Hm1SDIm5sKFG/Mn75LXIeD+NGmBAqswaGM4cQQ8AHir78f4aeTh?=
 =?us-ascii?Q?w9EytTblMOCzeFxVttqWQ0qcVht6G8o1rIEP7jowvqKYpo8RUcUnkM98qBaD?=
 =?us-ascii?Q?rmH74IKNdzgz7XnpvNRCYJQCrwT8ztbfl1aV7vRTvyLgaYjJ5oQXrzmheXLN?=
 =?us-ascii?Q?FAbIJifkrdQQjEWuL1NOO87xCoheCDUpt8gpoqRcxwiyhQJJ9tLYTPzK2bkA?=
 =?us-ascii?Q?NVFHr0DL1nY8/rJcJ8PGUCGIOcPl0R3roFrlUfyPKIJMAwmHMDA+JObE0s6L?=
 =?us-ascii?Q?G0PLeY5akQcbcaJgq9HCIexYhFteGMhVf+uxqdlx32Jwhbw39ucgJkxEDdPv?=
 =?us-ascii?Q?VLz2fY345Zob1I1XZYVYO2bBZ08+Q4ABH/H4QLB57zWoVNn/LWzZYx2lo12b?=
 =?us-ascii?Q?hF7jO8yaSFBXfapuKtAtuprPzhpRadDA0rqbyy5J59SvCNDaSE67ysrwuNsH?=
 =?us-ascii?Q?+JjdUoXyU6/8pGYaw4OQYoOVy3ocMr+nhJLHoHu5IGya13U9ilvAnYE96zEd?=
 =?us-ascii?Q?2UAXLxvm4frCJUQ6atP42yBWMMmC4j5Jxc7bJIUhmds+Wse/pKeJjalr0qzc?=
 =?us-ascii?Q?mTRnzc0dy3sAJEeYPDc2tn3JZZERbSZ4wzZco/E20o1hb/+lNQzuAbXlORGz?=
 =?us-ascii?Q?2Jg1QoM0+wQPZg8MCgKu1epQBDvjwRclkTMoODIJhomFn0a2n84BAqlnLATv?=
 =?us-ascii?Q?Pl1IVmq3yQ3Pq1kW1lluRfsneo57tYZywlz/mtfwoZMLsk7KkvASCvAYfGxS?=
 =?us-ascii?Q?1oqK6Oe/Gb4rqicnYzxTDj6+UBdNtyW66CakdEQsHMKn0S0rEZrpASPSdL/9?=
 =?us-ascii?Q?mtaUuwtslAeBvE3SKsKl+1HEeSft6oa1JvJlwgLwZvzIhJ0Sj9ayCXK25PPF?=
 =?us-ascii?Q?3mBmFDwGhoZj0zWu8V8ytADdKTDGzNSkJG6V5Sk1YXZgt4/3/4GwfxvgOF4z?=
 =?us-ascii?Q?yuvxmuZjrnkcNu4q197Oba+QsjK4Aw7bLwHegwh7lUR4xoENFi8g8AD4INnx?=
 =?us-ascii?Q?PPM/dOts+A3uCeQlpwMoGJlqqeF3BI7/+ghqlZ25PxbOl5tnmExG6C7lieSW?=
 =?us-ascii?Q?1/UWQX8WyGvRDNRWJDeEhEUDaDi4PsBzpVDNgqog5wbSXHYbYZeDMs/VD+3f?=
 =?us-ascii?Q?JBIfvg4aMT+OUxXTAmfG6E+XO3Jdswl5yvJVhVn0hTHJppoRBCjomkBWDPeX?=
 =?us-ascii?Q?n5fikzSAtft3wAbi24x15GBofk7cTXHZlUcer3dQPv7Vpu74k7hh/RgFez8U?=
 =?us-ascii?Q?pR8eghq/F9rNiVNxMV0lcZ8K8KlHVqxMo/+tq1trYn4M/uTCtPQHiRgpRExK?=
 =?us-ascii?Q?7OL80rzOk4tFd5wbTb+UjpUKJzEkUMUxEtIu5+nxLMJEVjOVCBKUHGaR6JzV?=
 =?us-ascii?Q?7sft0RzrrP29gGSOu9NMmVytXnRjUpNix+6PP2Hw/RylruCM1b3EVdsdut6U?=
 =?us-ascii?Q?rdrpjSypgjDjBevFEOvGN+0Q8e8UhduB2Gl2sEmhGvOghRDVxMKUwTTjyUgT?=
 =?us-ascii?Q?QM0H67J2pnn3I98UqNbySu1kAWzP8kjSezWYMS6Q8Dap0jSH7mi68wcij+O2?=
 =?us-ascii?Q?FXhFM4yzUxPpGncuBrk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ac198c55-f070-401f-c52a-08dc799955cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 13:24:25.6069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qn/thz727db9lh47OOJZPxyyPP9O5XdlXr0z8ZuLlRxRCROtTOoougM4rB9RQ7A+4fK16BFWEZdE6o0pOtPeJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6398


> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Tuesday, May 21, 2024 6:13 PM
>=20
> On Tue, May 21 2024, Parav Pandit <parav@nvidia.com> wrote:
>=20
> >> From: Cornelia Huck <cohuck@redhat.com>
> >> Sent: Tuesday, May 21, 2024 3:29 PM
> >>
> >> On Tue, May 21 2024, Parav Pandit <parav@nvidia.com> wrote:
> >>
> >> >> From: Michael S. Tsirkin <mst@redhat.com>
> >> >> Sent: Tuesday, May 21, 2024 12:55 PM
> >> >>
> >> >> On Tue, May 21, 2024 at 04:19:31AM +0000, Parav Pandit wrote:
> >> >> > Hi Michael,
> >> >> >
> >> >> > > From: Michael S. Tsirkin <mst@redhat.com>
> >> >> > > Sent: Wednesday, May 15, 2024 4:07 PM
> >> >> >
> >> >> > > > > I would wait until next Monday at least. Give everyone
> >> >> > > > > time to subscribe to the new list.
> >> >> >
> >> >> > Can you please merge this patch?
> >> >>
> >> >> Pushed now.
> >> >
> >> > Thanks Michael.
> >> > Cornelia mentioned in [1] that master and 1.4 should be merged.
> >> > 1.4 is 17 patches behind the master including this one.
> >> > And 12 commits behind..
> >> >
> >> > Can you please merge them? Without it, there are conflicts in patche=
s.
> >> >
> >> > Also, we need to update in the README.md on which branch to use for
> >> sending the patches.
> >> >
> >> > [1]
> >> > https://lists.oasis-open.org/archives/virtio-comment/202401/msg0008
> >> > 7.h
> >> > tml
> >>
> >> Repo status is a mess, because the state of the TC is currently a mess=
...
> >>
> >> * Before we can merge the branches, we need to do a proper Special
> >>   Majority Vote to release 1.3 (which had been delayed since *last yea=
r*
> >>   due to first the threatening migration, and then the actual
> >>   troublesome migration.)
> >> * The platform is still not working properly. For starters, we now kno=
w
> >>   that other people besides myself are not getting any mail from the
> >>   main TC list;
> > Can you please follow up with OASIS?
>=20
> Well, it's not like we've been sitting idle and not been following up...
>=20
Sure. Not sure why I sounded that way. I am sorry about it.
You mentioned you didn't know current status; this is why I asked if you ca=
n check the current status.
I see your voted for #03820, so I assumed that you got the email. :)

> >
> >> given that the ballot approving use of the new lists has
> >>   not gotten a vote from several usually reliable voters, I fear that
> >>   mail delivery regarding ballots is broken for some people as well...
> >>
> > I have followed up with OASIS for several of the members to fix their v=
oting
> and other broken access rights.
> > Are you following up for the rest, or should I? Please let me know.
>=20
> People have to tell me for me to do anything. If voting is not working,
> please let the chairs know. I don't want to start another ballot if some
> people are unable to participate.
>=20
So it is working for 17 out of 19 voters as they voted in the latest ballot=
.
If the person does not get any emails from OASIS main list, it is likely do=
esn't get the ballot email too.
And they wouldn't know that they were supposed to vote, until someone tells=
 them.

This is why I asked if you want to follow up.
I followed up with many to get their login etc sorted out.

> >
> > To my knowledge, voting is broken for Enrico Granata based on the ballo=
t
> #03820 and previous ballot #184, #189 etc.
> > Which other reliable voters are we missing?
> >
> >> Before requesting a Special Majority Vote, IMNSHO we need to be sure t=
hat
> >> voters actually get notified about it. [We have raised the issues with=
 mail
> >> delivery with OASIS staff, but I'm really unsure about the current sta=
tus.]
> >>
> > Can you please check the current status with OASIS?
> > The migration by them is completed in March more than 2 months ago.
>=20
> The migration is "finished", problems persist, OASIS has been notified
> multiple times. I, as a chair, do not consider myself fully
> operational. The joys of outsourcing.
>=20
What are the missing things for you to be operational, maybe I can follow u=
p on your behalf with OASIS?
If that reduces your load...

> >
> >> virtio-comment subscribers who are TC members as well: if you didn't g=
et
> any
> >> emails from either the main TC mailing list (you can check the
> >> archives) or from the voting platform, we'd like to hear about it.
> >
> > Contributors are not blocked anymore as the reviews have started alread=
y
> with new list, which is good.
> > Your previous recommendation of using the branch 1.4 for all the spec
> patches, likely still stays the same. Right?
> >
> > [1] https://lists.oasis-open.org/archives/virtio-
> comment/202401/msg00087.html
>=20
> Yes, as long as we have not finalized 1.3, patches need to target
> 1.4. Yes, it's a mess, and I'm highly frustrated.

Ok. got it. Thanks for the quick confirmation.
