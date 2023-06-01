Return-Path: <virtio-comment-return-6070-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801A5C77B7A
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 16:20:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AE37F33565
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 16:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by host09.ws5.connectedcommunity.org (Postfix) with QMQP
	id 9E6CC330B6; Thu,  1 Jun 2023 16:20:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DB9C9986613;
	Thu,  1 Jun 2023 16:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9e5eFrzzRjGr6KDnhjkMRq5B19XZSLvoQiKdZA3YvMPxQ87cINJiQgD2S6ClVlK0TQO+2kAqzzzZR1KVkoYtuAdxYyze51o8HH8p0Tj9gZsvXiHOdjwl7Sm48XlUskmJ3IrlrJVuVzimj6o504Fz2xay59qA1+L8kgqgKadQuJ3g3ARtgfGC+GUm+9QUyggFQPHPsmBuR2kEZXig4lXnXOjh9pFPS9rVWXt00AtrE7v12hugVBlaReUrWx8tz62Z3aj7BX9/jEK3nQg7Sgobx1uv4jE+BdXNA01sSHxsMFvXv8C9HOuSAJycxWJCUPQ1xC9aVZSfpPWxivSI+Y9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ffj3XKM957r1HzGK5ErmP6gK6UwKBG65e3nA2dfYRM=;
 b=aHBeVPxSf0I0eu2MgyMNIWXi0dOLxcIHmmf/C1Apj5EX4Ht93umJqRt+/PxrNJd7flCi05SX0xlH+TE6q0KEPg0r35cq3H/nILq/iLW3+l9N8cEQAiuq76wlRnDah2z4GyYR5piTm3iZgN2/f8vbo+E1WxCEqF9Zm6V5T7Wi4ezqmnNUxevFMayhSVoxLyHJflVETDaCrEm9n1ruN9SmSIx6oOj3qmaD8ls+oPXvxpj8yrgr+t2djqHyDEPjgRsMoe+46niD3U774DUnVGooFZY2laBNhr0WmX5Sd14ymrPCuNlzHNP1FVS10VzUWYt6ID7i68K8oljGAYzUj2yteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio] Re: [virtio-comment] virtio networking collaboration
 meeting: call for agenda
Thread-Index: AdmJCcjCjRUFdJrUSz6FqEiskKvSlQLmlDmAAAAi/4A=
Date: Thu, 1 Jun 2023 16:19:36 +0000
Message-ID:
 <PH0PR12MB54816AC81BE03DC46848B2C0DC499@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230601121137-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230601121137-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB8699:EE_
x-ms-office365-filtering-correlation-id: 42530410-8c89-4527-62b4-08db62bbfdf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FRIQxEPF6nzpoZvY1KZJqDCy5LsbHc+Zj4h24BMI75Zrux387WrBZuIM0wRJvsVbL0cRq6J1r21wkdBb2K62x1X0IbOe20niy/a5UQUZif8oQU/dglGLHzFTHD/Wi4HkTledP4juHCBRF887yUm/yImcOkxSh8Q1j8cRoGB8VWAPrXNEc9JGq5zszFe24IFNwBEZLI+vlJ0u5aBX8lkibEZujPcl2D9S50ageSS9UP7UUPkOSp14Dl62koNDdnjy5hvkbWgpEHbD18umE+G0WuCr2pg9svIwNPGn80yhu9/QmvTCiZSTA3CqTALhfndD5cnRsSokgXWnf00JSzJn72Bj1NM6m0IClyI1IrlK60Ai7l9n/OFT3QIcl5ZRR6rtTwg167SEwdgF4/Ix7/9hsx+F3PJ9+mCWiY3vox+ShjtYuKuJMR/ArReRNdkORIPoNybH+NqT6ZpG4whePv+2UgR/DktCjxsziA1Pff9LjqNJNl+LFsoScdG6kNvKB6WdB1PzsTmjLIz9Pqii0Dun4csjzsSQPFFpTIdcmZHyoXK7DK4bP0WFfszFIWTSYPI47RymNtRTNNZNivS183yYlcafdThipgnksoFk2IDEv04TDVfPDobFw8u5aLz3/2mh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(186003)(41300700001)(38100700002)(9686003)(6506007)(478600001)(66476007)(71200400001)(54906003)(7696005)(4326008)(76116006)(66946007)(64756008)(122000001)(55016003)(316002)(66556008)(2906002)(52536014)(86362001)(8936002)(8676002)(66446008)(38070700005)(4744005)(33656002)(5660300002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MT6Wr2fhSeOODhWov10LLwGQLyF+gcnzXaTJv2l6UVDXL+zPn5V4O7IQlDHd?=
 =?us-ascii?Q?WoVQBzZlvilP9JDR6c/5TLC/Fnucsv8lsEDzNvSA8AC72gbfeO7HdmMonog9?=
 =?us-ascii?Q?/SnlYRi+AyChF812qYNDPhEEONxLbwnSLImXlzVQRAHpOeyF6pfE+EX3vMqB?=
 =?us-ascii?Q?PFJcotTXbWZcjBCguSKmlkFPXhgeK5YA6GK+CLGFr6fKD1+WxOEgy3eLzFb8?=
 =?us-ascii?Q?rgZrEyehujheEzgAwi3qk6V3HEywwiQHw6pqt2BRywY0Ng3uqO3enumCfHa/?=
 =?us-ascii?Q?NDpgIous/aSmDGh88JD5wVfgPCLarNWqBiHZhmuzv1ndGnRoqe+7pPFgyInx?=
 =?us-ascii?Q?8SM52kztciz624Pr8LcGrJGnAN0fchsbvCb/HxvXFPTnMkf8u3Mv7gosCQHH?=
 =?us-ascii?Q?PLRpWEP1mAAlUa+3Tu/1usw4tkdLMORDgInTzmCvYWnBvBGeJ6YLbxTj1NmI?=
 =?us-ascii?Q?dnu7VWw5l4ogJDBaidg6GR5tLlN2vKIIvMTr1mKwyrt4ZgoxOw5bqrUv3MA2?=
 =?us-ascii?Q?xPyc56WiD5tIwc5O3YZNU2zageh29Bb56PxRsIgZSDOcaN3dOSGjOw/J97U3?=
 =?us-ascii?Q?Z/sd+6yI9lXrZsMvaF4MmzwhXs/1zAdJXK1a02rbr9/oFZTBjeRw0GWUMYXw?=
 =?us-ascii?Q?wt/ScABzoFqkmED9fvTqQk8OlujP8Hy8v803rfZ/8mk3ctW8M3qRhIrfs5ej?=
 =?us-ascii?Q?zjpyLxcPXroPkRVShKzl9qgNFcDg1pmsVEnrX0kZUgVsIWntqxmv8t0xy3Qo?=
 =?us-ascii?Q?M0iAjpgMtcsPSDvx+iH5Q7eG9QU3K2ch0gFO3c3YDDkAvemMDevyIQdzD+oY?=
 =?us-ascii?Q?Y91E2FvAxNRgLaqJQIZuR8CUKghnEizGQ2a9qfAdDNfSJyy7Th7oJANhO8hD?=
 =?us-ascii?Q?AvJ5j39xNtIugb2LLaLonUUVfiWRl3Z7+htES5pHiTlrnOXpPZrggoUpuTGM?=
 =?us-ascii?Q?zQg83VgRfEt15QatTsvJ75qq/t3fm8JddeAodwS9UM52SPkWRdmvHMVsSb/V?=
 =?us-ascii?Q?Ii9b5z9MfQE7k3Ifqi+BZBSP9Ccb9YcdmSsrD6hJqu7buWsDm9ntD60QHv7M?=
 =?us-ascii?Q?TfPp25fXd64M/0fg4Wc9hl6tcRKfvhnEqkd4dlSppJxQPxDjrBiZ4Wmnen9w?=
 =?us-ascii?Q?vLcfQGpl+1zW1PNwBUS5o90aIGyUN7fuKq+3QRjxuZ+tOCxmAlz3NyPOVBXq?=
 =?us-ascii?Q?j2FlpGT0NAybn01X1vtcZ5fJErZmL+2gvHzlkmCCsTVHVco7UMKGfmOgiel/?=
 =?us-ascii?Q?h5/OWuRS1fAh3yi5e83jD8WnZgj+7qFdNJtFPbyOwXSdW6+FqtUzgthH0cNn?=
 =?us-ascii?Q?8NPeD0ekcy5A6vvJsb9yFac1q8EJYOrx3gak+KRfRmcXqrAxdFcgHIcSZy9Z?=
 =?us-ascii?Q?UVXbumHqjWN+FSYOIyzAU6l04Pyr9qRGyH2uDv03PmZSMCctVmVTJuAsMwvf?=
 =?us-ascii?Q?bUz1OavGdnMttEwBoXoRrEOP0ax9qDQXChbMPfSkPZVk5nKEw5sEn4RQG6sM?=
 =?us-ascii?Q?KmDYPG21mkvYmlPvvsnhJIaWjQlsJR09+KMQyhBiSFwzmYwsj8fApqcWMicU?=
 =?us-ascii?Q?GwtknHPL1QnXo2aEaDof8h14Bro4/8Trb379R7aikDBoUlOZiqXANnShKGHL?=
 =?us-ascii?Q?jCd3dIYy6ZDitoyqvcMg/Go=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42530410-8c89-4527-62b4-08db62bbfdf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 16:19:36.1870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qCnJ+CxUlHCAbekLr3QlAI/suRrolF9vU9G/VZXcc6ZNBr8/Jpg1aEZl4cb491pk4mlK1bTNVXMtmsDTxfeSig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699
Subject: [virtio-comment] RE: [virtio] Re: [virtio-comment] virtio networking collaboration
 meeting: call for agenda


> From: virtio@lists.oasis-open.org <virtio@lists.oasis-open.org> On Behalf=
 Of
> Michael S. Tsirkin
> Sent: Thursday, June 1, 2023 12:14 PM
>=20
> On Thu, May 18, 2023 at 12:53:56AM +0000, Parav Pandit wrote:
> > For the first meeting, I propose the following agenda item:
> > - discuss new virtio net device features for 1.4 spec release
>=20
> Want to include a bit more detail here?  What do you want to discuss? At =
the
> moment the only thing I see on list is inner hash proposal.

Yes, I would like to discuss list of features to go through at high level.
In process of creating virtio-docs patch that we can review and store.
Will send out the link hopefully in couple of hours.

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

